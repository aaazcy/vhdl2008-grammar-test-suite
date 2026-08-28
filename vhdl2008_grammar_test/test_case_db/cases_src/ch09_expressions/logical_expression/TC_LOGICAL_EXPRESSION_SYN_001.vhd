-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: minimal form: a single relation (a < b), containing no logical operator, as the smallest form of logical_expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_min_ent is
  port(a, b : in integer; y : out boolean);
end entity;
architecture rtl of logexpr_min_ent is
begin
  y <= a < b;
end architecture rtl;
