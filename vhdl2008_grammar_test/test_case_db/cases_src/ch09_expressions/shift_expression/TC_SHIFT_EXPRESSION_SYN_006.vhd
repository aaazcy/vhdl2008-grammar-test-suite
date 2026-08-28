-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: rol rotate left: all bits rotate left, the highest bit moves into the lowest bit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity shf_rol_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity;
architecture rtl of shf_rol_ent is
  constant ROTATE_BY : integer := 1;
begin
  dout <= din rol ROTATE_BY;
end architecture rtl;
