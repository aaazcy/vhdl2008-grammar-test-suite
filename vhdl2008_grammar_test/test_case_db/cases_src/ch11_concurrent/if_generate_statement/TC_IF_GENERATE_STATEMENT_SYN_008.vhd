-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: condition as a complex boolean expression——`if (WIDTH = 8 and SPEED = true) generate` combines two generics with logical and, verifying that the if generate condition supports compound boolean expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ifgen_complex_cond_ent is
  generic(WIDTH : integer := 8; SPEED : boolean := true);
  port(clk : in bit; din : in bit_vector(15 downto 0); dout : out bit_vector(15 downto 0));
end entity ifgen_complex_cond_ent;
architecture bh of ifgen_complex_cond_ent is
begin
  gen_fast8 : if (WIDTH = 8 and SPEED = true) generate
    dout(7 downto 0) <= din(7 downto 0);
    dout(15 downto 8) <= (others => '0');
  elsif (WIDTH = 16 and SPEED = false) generate
    signal s_reg : bit_vector(15 downto 0);
  begin
    proc_slow : process(clk) is
    begin
      if clk'event and clk = '1' then
        s_reg <= din;
        dout  <= s_reg;
      end if;
    end process proc_slow;
  end;
  else generate
    dout <= din;
  end generate gen_fast8;
end architecture bh;
