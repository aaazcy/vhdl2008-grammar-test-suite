-- =============================================================
-- Case ID: TC_TERM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Test Focus: SNN — missing factor after multiplying_operator: nothing to the right of *, so the chain is incomplete
-- Expected Result: Triggers syntax error: missing factor after multiplying operator
-- Dependencies: None
-- =============================================================
entity term_snn1_ent is
  port(a : in integer; y : out integer);
end entity;
architecture err of term_snn1_ent is
begin
  y <= a * ;
end architecture err;
