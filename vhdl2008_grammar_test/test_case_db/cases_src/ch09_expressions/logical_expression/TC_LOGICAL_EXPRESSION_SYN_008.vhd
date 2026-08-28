-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: xnor chain: multiple relations connected with xnor, verifying the repeated form relation { xnor relation }
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_xnor_chain_ent is
  port(a_eq_b, b_eq_c : in boolean; all_eq : out boolean);
end entity;
architecture rtl of logexpr_xnor_chain_ent is
begin
  all_eq <= a_eq_b xnor b_eq_c;
end architecture rtl;
