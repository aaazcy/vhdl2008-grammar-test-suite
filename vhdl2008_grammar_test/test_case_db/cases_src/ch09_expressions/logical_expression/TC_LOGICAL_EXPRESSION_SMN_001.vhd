-- =============================================================
-- Case ID: TC_LOGICAL_EXPRESSION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_LOGICAL_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_expression ::= relation { and relation } | relation { or relation } | relation { xor relation } | relation [ nand relation ] | relation [ nor relation ] | relation { xnor relation }
-- Case Type: Negative
-- Rule Description: Logical operators require operands of the same boolean/bit type
-- Error Category: type_mismatch
-- Test Focus: SMN: logical operation type mismatch — in p and a, p is boolean type while a is bit type, the relation types on the two sides of and are inconsistent
-- Expected Result: Triggers analysis error: no function declarations for operator "and"
-- Dependencies: None
-- =============================================================
entity logexpr_bool_and_bit is
  port(p : in boolean; a : in bit; r : out boolean);
end entity;
architecture vhdl2008 of logexpr_bool_and_bit is
begin
  r <= p and a;
end architecture vhdl2008;
