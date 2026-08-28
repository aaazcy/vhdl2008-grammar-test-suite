-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Rule Description: Short-circuit operators (and/or) are evaluated left-to-right; all nand/nor/xnor/and/or/xor require boolean-compatible operands
-- Error Category: type_mismatch
-- Test Focus: non-boolean operands: an integer type expression used directly in an and operation, logical operators require boolean/bit type operands
-- Expected Result: Triggers semantic error: logical operator requires boolean-compatible operand
-- Dependencies: None
-- =============================================================
entity logexpr_smn2_ent is
  port(x, y, z : in integer; r : out boolean);
end entity;
architecture err of logexpr_smn2_ent is
begin
  r <= x and y and z;
end architecture err;
