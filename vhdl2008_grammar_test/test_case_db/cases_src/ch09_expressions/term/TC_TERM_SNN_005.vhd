-- =============================================================
-- Case ID: TC_TERM_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Test Focus: SNN — rem used with a non-integer right side: both sides of the rem operator must be integer type, and using real as the divisor is an error
-- Expected Result: Triggers semantic error: rem operator requires integer operands
-- Dependencies: None
-- =============================================================
entity term_snn5_ent is
  port(a : in integer; b : in real; y : out integer);
end entity;
architecture err of term_snn5_ent is
begin
  y <= a rem b;
end architecture err;
