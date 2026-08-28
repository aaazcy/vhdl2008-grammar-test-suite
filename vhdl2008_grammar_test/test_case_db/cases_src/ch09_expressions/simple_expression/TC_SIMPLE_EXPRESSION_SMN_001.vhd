-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Rule Description: The sign operator requires a numeric operand
-- Error Category: type_mismatch
-- Test Focus: sign applied to a non-numeric type: the - prefix acts on bit type, bit is not a numeric type
-- Expected Result: Triggers semantic error: sign operator requires numeric operand
-- Dependencies: None
-- =============================================================
entity sexpr_smn1_ent is
  port(flag : in bit; y : out bit);
end entity;
architecture err of sexpr_smn1_ent is
begin
  y <= -flag;
end architecture err;
