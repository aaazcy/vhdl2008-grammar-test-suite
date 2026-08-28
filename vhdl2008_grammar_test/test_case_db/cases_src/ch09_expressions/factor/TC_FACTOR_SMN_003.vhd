-- =============================================================
-- Case ID: TC_FACTOR_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Rule Description: Logical operator (and/or/xor as unary) requires array type operand
-- Error Category: type_mismatch
-- Test Focus: reduction operator type error: the xor primary form applied to the integer type; a reduction logical operator requires an array type operand
-- Expected Result: Triggers semantic error: unary logical operator requires one-dimensional array operand
-- Dependencies: None
-- =============================================================
entity fac_smn3_ent is
  port(data : in integer; y : out bit);
end entity;
architecture err of fac_smn3_ent is
begin
  y <= xor data;
end architecture err;
