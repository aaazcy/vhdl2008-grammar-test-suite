-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Rule Description: The case expression in a case generate statement must be locally static; only the selected alternative is elaborated at compile time, and different alternatives can declare different objects without conflict
-- Case Type: Positive
-- Test Focus: branches of case generate declare same-named signals of different types — when 0 declares `signal s_buf : bit_vector(7 downto 0)` and when 1 declares `signal s_buf : bit_vector(15 downto 0)`, and because only the selected branch takes part in elaboration, the same-named signals do not conflict
-- Expected Result: Compiles successfully; only the selected branch's s_buf is elaborated
-- Dependencies: None
-- =============================================================
entity cgen_sem1_ent is
  generic(WIDTH_SEL : integer := 0);
  port(clk : in bit; din8 : in bit_vector(7 downto 0); din16 : in bit_vector(15 downto 0); dout : out bit_vector(31 downto 0));
end entity cgen_sem1_ent;
architecture bh of cgen_sem1_ent is
begin
  gen_mux : case WIDTH_SEL generate
    when 0 =>
      signal s_buf : bit_vector(7 downto 0);
    begin
      s_buf <= din8;
      dout(7 downto 0) <= s_buf;
      dout(31 downto 8) <= (others => '0');
    end;
    when 1 =>
      signal s_buf : bit_vector(15 downto 0);
    begin
      s_buf <= din16;
      dout(15 downto 0) <= s_buf;
      dout(31 downto 16) <= (others => '0');
    end;
    when others =>
      dout <= (others => '0');
  end generate gen_mux;
end architecture bh;
