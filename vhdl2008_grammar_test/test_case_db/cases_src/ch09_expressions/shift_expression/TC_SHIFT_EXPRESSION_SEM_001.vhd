-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Rule Description: Shift operators require left operand of one-dimensional array type (bit_vector, signed, unsigned) and right operand of integer type
-- Test Focus: signed vector sla shift: signed(7 downto 0) sla integer, left operand is a signed one-dimensional array and right operand is integer, conforming to the type rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity shf_sem1_ent is
  port(din : in signed(7 downto 0); dout : out signed(7 downto 0));
end entity;
architecture rtl of shf_sem1_ent is
begin
  dout <= din sla 1;
end architecture rtl;
