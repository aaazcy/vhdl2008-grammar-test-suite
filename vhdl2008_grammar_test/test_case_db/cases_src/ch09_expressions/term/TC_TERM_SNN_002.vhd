-- =============================================================
-- Case ID: TC_TERM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Test Focus: SNN — doubled operators: two consecutive multiplying_operators with no factor in between
-- Expected Result: Triggers syntax error: consecutive multiplying operators without intervening factor
-- Dependencies: None
-- =============================================================
entity term_snn2_ent is
  port(a, b : in integer; y : out integer);
end entity;
architecture err of term_snn2_ent is
begin
  y <= a * / b;
end architecture err;
