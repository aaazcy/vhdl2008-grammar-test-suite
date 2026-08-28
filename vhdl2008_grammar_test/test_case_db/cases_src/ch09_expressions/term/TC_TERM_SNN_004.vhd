-- =============================================================
-- Case ID: TC_TERM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Test Focus: SNN — dangling operator: * is missing the right-side factor and reaches end of line, so the term is unclosed
-- Expected Result: Triggers syntax error: dangling multiplying operator
-- Dependencies: None
-- =============================================================
entity term_snn4_ent is
  port(a, b, c : in integer; y : out integer);
end entity;
architecture err of term_snn4_ent is
begin
  y <= a * b * ;
end architecture err;
