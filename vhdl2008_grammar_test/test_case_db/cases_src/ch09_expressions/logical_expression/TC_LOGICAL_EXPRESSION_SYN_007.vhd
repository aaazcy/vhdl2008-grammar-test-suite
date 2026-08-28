-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: nor pair: the relation [ nor relation ] form, two relations combined with the NOR operation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_nor_ent is
  port(x, y : in boolean; r : out boolean);
end entity;
architecture rtl of logexpr_nor_ent is
begin
  r <= x nor y;
end architecture rtl;
