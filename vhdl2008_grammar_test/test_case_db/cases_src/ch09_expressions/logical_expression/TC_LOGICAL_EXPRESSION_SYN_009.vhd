-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: nand with a single relation: the nand part of rel [ nand rel ] is optional, keeping only the first relation, verifying the optional syntax slot
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_nand_single_ent is
  port(a, b : in integer; r : out boolean);
end entity;
architecture rtl of logexpr_nand_single_ent is
begin
  r <= a = b;
end architecture rtl;
