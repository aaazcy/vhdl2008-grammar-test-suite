-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Test Focus: SNN — extra logical operator: nand followed by and in the same chain, the optional nand form only allows [ nand relation ] and cannot chain and afterwards
-- Expected Result: Triggers syntax error: nand operator cannot be followed by another logical operator
-- Dependencies: None
-- =============================================================
entity logexpr_snn3_ent is
  port(a, b, c : in boolean; r : out boolean);
end entity;
architecture err of logexpr_snn3_ent is
begin
  r <= a nand b and c;
end architecture err;
