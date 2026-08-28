-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: and chain: two relations chained with and, verifying the basic form relation { and relation }
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_and2_ent is
  port(x, y, z : in integer; r : out boolean);
end entity;
architecture rtl of logexpr_and2_ent is
begin
  r <= (x < y) and (y < z);
end architecture rtl;
