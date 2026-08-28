-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: or chain: multiple relations chained with or, used for judging whether any of multiple conditions is satisfied in alarm/detection scenarios
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_or_chain_ent is
  port(tmp_high, pres_high, volt_low : in boolean; alarm : out boolean);
end entity;
architecture rtl of logexpr_or_chain_ent is
begin
  alarm <= tmp_high or pres_high or volt_low;
end architecture rtl;
