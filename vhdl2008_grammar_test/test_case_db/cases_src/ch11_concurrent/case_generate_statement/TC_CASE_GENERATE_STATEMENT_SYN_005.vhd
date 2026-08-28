-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: end generate followed by generate_label — `end generate gen_alu;` explicitly repeats the generate label name, verifying that the end of case generate may close with a label
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cgen_label_close_ent is
  generic(OP_SEL : integer := 0);
  port(a, b : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity cgen_label_close_ent;
architecture bh of cgen_label_close_ent is
begin
  gen_alu : case OP_SEL generate
    when 0 =>
      y <= a and b;
    when 1 =>
      y <= a or b;
    when 2 =>
      y <= a xor b;
    when others =>
      y <= not a;
  end generate gen_alu;
end architecture bh;
