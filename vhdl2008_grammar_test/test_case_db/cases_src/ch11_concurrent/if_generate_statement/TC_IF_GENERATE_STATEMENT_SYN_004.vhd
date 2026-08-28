-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: if-elsif-else three-way selection——different pipeline depths are chosen by the generic PIPELINE: 0 pass-through, 1 single stage, 2+ double stage, verifying the complete if/elsif/else structure of a multi-branch if generate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ifgen_trifurcate_ent is
  generic(PIPELINE : integer := 0);
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity ifgen_trifurcate_ent;
architecture bh of ifgen_trifurcate_ent is
begin
  gen_pipe : if PIPELINE = 0 generate
    dout <= din;
  elsif PIPELINE = 1 generate
    signal s_reg : bit_vector(7 downto 0);
  begin
    proc_ff : process(clk) is
    begin
      if clk'event and clk = '1' then
        s_reg <= din;
        dout  <= s_reg;
      end if;
    end process proc_ff;
  end;
  else generate
    signal s_s1, s_s2 : bit_vector(7 downto 0);
  begin
    proc_s1 : process(clk) is
    begin
      if clk'event and clk = '1' then s_s1 <= din; end if;
    end process proc_s1;
    proc_s2 : process(clk) is
    begin
      if clk'event and clk = '1' then s_s2 <= s_s1; dout <= s_s2; end if;
    end process proc_s2;
  end;
  end generate gen_pipe;
end architecture bh;
