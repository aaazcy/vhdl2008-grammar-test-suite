-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: three or more relations chained with and: relation { and relation } repeated three times, verifying any number of and chains
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_and_multi_ent is
  port(a, b, c, d : in integer; r : out boolean);
end entity;
architecture rtl of logexpr_and_multi_ent is
begin
  r <= (a < b) and (b < c) and (c < d) and (a < d);
end architecture rtl;
