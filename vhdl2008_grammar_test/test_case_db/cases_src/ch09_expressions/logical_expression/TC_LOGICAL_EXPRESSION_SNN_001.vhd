-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Test Focus: SNN — missing relation: no relation after the and operator, the BNF relation { and relation } requires a relation after and
-- Expected Result: Triggers syntax error: missing relation after 'and' operator
-- Dependencies: None
-- =============================================================
entity logexpr_snn1_ent is
  port(a, b : in integer; r : out boolean);
end entity;
architecture err of logexpr_snn1_ent is
begin
  r <= a < b and;
end architecture err;
