-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Rule Description: Shift count (right operand) must be integer type
-- Error Category: type_mismatch
-- Test Focus: wrong shift count type: the right side of srl is real value 2.0, an illegal shift count type
-- Expected Result: Triggers semantic error: shift count must be integer type
-- Dependencies: None
-- =============================================================
entity shf_smn2_ent is
  port(a : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture err of shf_smn2_ent is
  constant SHIFT : real := 2.0;
begin
  y <= a srl SHIFT;
end architecture err;
