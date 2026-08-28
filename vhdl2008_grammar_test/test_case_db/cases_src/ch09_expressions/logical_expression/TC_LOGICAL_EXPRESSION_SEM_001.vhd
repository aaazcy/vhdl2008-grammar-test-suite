-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Rule Description: All relations in a logical_expression with the same logical operator must have compatible boolean result types
-- Test Focus: same-type logical operation: all relations return boolean type, and the relations connected by and in the logical_expression return consistent types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_sem1_ent is
  port(a, b, c, d : in bit; r : out boolean);
end entity;
architecture rtl of logexpr_sem1_ent is
begin
  r <= (a = b) and (c = d);
end architecture rtl;
