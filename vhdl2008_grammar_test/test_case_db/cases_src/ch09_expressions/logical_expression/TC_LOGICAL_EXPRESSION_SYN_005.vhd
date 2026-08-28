-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Positive
-- Test Focus: xor chain: multiple relations connected with xor, suitable for parity check logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logexpr_xor_chain_ent is
  port(p1, p2, p3, p4 : in boolean; parity : out boolean);
end entity;
architecture rtl of logexpr_xor_chain_ent is
begin
  parity <= p1 xor p2 xor p3 xor p4;
end architecture rtl;
