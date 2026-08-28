-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: srl logical right shift: bit_vector srl 2, all bits shift right and the highest bit is filled with zero
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity shf_srl_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity;
architecture rtl of shf_srl_ent is
  signal sh_amt : integer := 2;
begin
  dout <= din srl sh_amt;
end architecture rtl;
