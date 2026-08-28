-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: sll logical left shift: bit_vector sll 3, all bits shift left and the lowest bit is filled with zero
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity shf_sll_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity;
architecture rtl of shf_sll_ent is
  signal shift_amt : integer := 3;
begin
  dout <= din sll shift_amt;
end architecture rtl;
