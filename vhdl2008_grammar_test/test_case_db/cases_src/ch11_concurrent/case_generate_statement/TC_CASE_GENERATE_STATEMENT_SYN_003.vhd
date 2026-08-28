-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: a case generate with three branches — the generic WIDTH selects adder implementations of different widths: when 8/16/32 generate 8/16/32-bit datapaths respectively, verifying that each alternative of a multi-branch case generate generates a different hardware structure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cgen_triple_ent is
  generic(WIDTH : integer := 8);
  port(a, b : in bit_vector(31 downto 0); y : out bit_vector(31 downto 0));
end entity cgen_triple_ent;
architecture bh of cgen_triple_ent is
begin
  gen_width : case WIDTH generate
    when 8 =>
      y(7 downto 0) <= a(7 downto 0) xor b(7 downto 0);
      y(31 downto 8) <= (others => '0');
    when 16 =>
      y(15 downto 0) <= a(15 downto 0) xor b(15 downto 0);
      y(31 downto 16) <= (others => '0');
    when 32 =>
      y <= a xor b;
    when others =>
      y <= (others => '0');
  end generate gen_width;
end architecture bh;
