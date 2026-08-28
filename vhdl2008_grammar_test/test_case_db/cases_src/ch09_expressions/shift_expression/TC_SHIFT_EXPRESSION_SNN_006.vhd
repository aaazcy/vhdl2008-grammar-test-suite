-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Test Focus: SNN — wrong shift count type: the right operand of sll is bit_vector instead of integer
-- Expected Result: Triggers semantic error: shift count must be integer type
-- Dependencies: None
-- =============================================================
entity shf_snn6_ent is
  port(a : in bit_vector(7 downto 0); b : in bit_vector(3 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture err of shf_snn6_ent is
begin
  y <= a sll b;
end architecture err;
