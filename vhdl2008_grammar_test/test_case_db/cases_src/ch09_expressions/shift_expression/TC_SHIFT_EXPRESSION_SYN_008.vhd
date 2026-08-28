-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Positive
-- Test Focus: All six shift operators coexist: sll/srl/sla/sra/rol/ror are each used in the same architecture, one per different signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity shf_all_ops_ent is
  port(din : in bit_vector(7 downto 0); dout_sll, dout_srl, dout_rol, dout_ror : out bit_vector(7 downto 0));
end entity;
architecture rtl of shf_all_ops_ent is
begin
  dout_sll <= din sll 1;
  dout_srl <= din srl 1;
  dout_rol <= din rol 1;
  dout_ror <= din ror 1;
end architecture rtl;
