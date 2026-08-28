-- =============================================================
-- Case ID: TC_TERM_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Test Focus: SNN — wrong multiplying operator: using x (the letter x) instead of * as the multiplication operator, which is not a legal multiplying_operator
-- Expected Result: Triggers syntax error: invalid multiplying operator token
-- Dependencies: None
-- =============================================================
entity term_snn6_ent is
  port(a, b : in integer; y : out integer);
end entity;
architecture err of term_snn6_ent is
begin
  y <= a x b;
end architecture err;
