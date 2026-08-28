-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: Complex left-side expression: a parenthesized bit operation as the simple_expression on the left side of shift, (a and mask) sll n
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity shf_complex_lhs_ent is
  port(a : in bit_vector(7 downto 0); mask : in bit_vector(7 downto 0); n : in integer; dout : out bit_vector(7 downto 0));
end entity;
architecture rtl of shf_complex_lhs_ent is
begin
  dout <= (a and mask) sll n;
end architecture rtl;
