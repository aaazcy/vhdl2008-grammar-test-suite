-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Positive
-- Test Focus: string concatenation: s_a & s_b joins two string signals with the & operator into a longer string expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_str_cat is
  port (
    a : in  string(1 to 3);
    b : in  string(1 to 4);
    y : out string(1 to 7)
  );
end entity ent_str_cat;

architecture concat of ent_str_cat is
begin
  y <= a & b;
end architecture concat;
