-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Test Focus: SNN — consecutive logical operators without operands: two xor adjacent with no intervening relation, BNF does not allow consecutive operators
-- Expected Result: Triggers syntax error: consecutive logical operators without intervening relation
-- Dependencies: None
-- =============================================================
entity logexpr_snn4_ent is
  port(a, b : in boolean; r : out boolean);
end entity;
architecture err of logexpr_snn4_ent is
begin
  r <= a xor xor b;
end architecture err;
