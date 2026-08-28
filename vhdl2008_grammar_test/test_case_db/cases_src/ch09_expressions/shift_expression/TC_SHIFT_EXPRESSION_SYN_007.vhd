-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: ror rotate right: all bits rotate right, the lowest bit moves into the highest bit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity shf_ror_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity;
architecture rtl of shf_ror_ent is
begin
  dout <= din ror 3;
end architecture rtl;
