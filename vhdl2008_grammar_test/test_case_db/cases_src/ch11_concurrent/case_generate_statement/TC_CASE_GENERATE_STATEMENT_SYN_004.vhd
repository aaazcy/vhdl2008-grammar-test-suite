-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: case generate whose expression is a generic — the generic integer value `DATA_MODE` drives the case expression, and each branch contains a component instantiation and a process, verifying that a generic-driven case generate can implement different architecture selections
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cgen_generic_ent is
  generic(DATA_MODE : integer := 0);
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity cgen_generic_ent;
architecture bh of cgen_generic_ent is
begin
  gen_mode : case DATA_MODE generate
    when 0 =>
      dout <= din;
    when 1 =>
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
    when 2 =>
      signal s_pipe1, s_pipe2 : bit_vector(7 downto 0);
    begin
      proc_pipe : process(clk) is
      begin
        if clk'event and clk = '1' then
          s_pipe1 <= din;
          s_pipe2 <= s_pipe1;
          dout    <= s_pipe2;
        end if;
      end process proc_pipe;
    end;
    when others =>
      dout <= not din;
  end generate gen_mode;
end architecture bh;
