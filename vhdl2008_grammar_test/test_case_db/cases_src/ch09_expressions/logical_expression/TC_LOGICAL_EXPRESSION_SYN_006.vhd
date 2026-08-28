-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: nand pair: the relation [ nand relation ] form, two relations combined with the NAND operation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_nand_ent is
  port(a, b : in boolean; r : out boolean);
end entity;
architecture rtl of logexpr_nand_ent is
begin
  r <= a nand b;
end architecture rtl;
