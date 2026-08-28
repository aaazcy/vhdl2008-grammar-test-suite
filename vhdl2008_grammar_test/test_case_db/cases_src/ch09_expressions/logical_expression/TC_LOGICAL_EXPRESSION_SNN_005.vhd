-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Test Focus: SNN — wrongly using a logical operator in place of a comparison operator: arithmetic + used at a logical_expression position instead of a relational operator
-- Expected Result: Triggers syntax error: expected relation, found arithmetic expression
-- Dependencies: None
-- =============================================================
entity logexpr_snn5_ent is
  port(a, b, c, d : in integer; r : out boolean);
end entity;
architecture err of logexpr_snn5_ent is
begin
  r <= a + b and c + d;
end architecture err;
