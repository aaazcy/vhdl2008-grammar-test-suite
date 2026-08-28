-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Test Focus: SNN — mixing different logical operators without parentheses causes ambiguity: and and or in the same logical_expression without parentheses, BNF does not allow mixing across operator chains
-- Expected Result: Triggers syntax error: mixed logical operators require parentheses
-- Dependencies: None
-- =============================================================
entity logexpr_snn2_ent is
  port(a, b, c : in boolean; r : out boolean);
end entity;
architecture err of logexpr_snn2_ent is
begin
  r <= a and b or c;
end architecture err;
