-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Negative
-- Test Focus: SNN: missing the shift amount simple_expression on the right of shift_operator — "din sll" is directly followed by a semicolon with no shift amount, verifying that in BNF shift_expression ::= simple_expression [ shift_operator simple_expression ] the simple_expression on the right of shift_operator cannot be omitted
-- Expected Result: Triggers syntax error: missing shift amount after shift_operator
-- Dependencies: None
-- =============================================================
entity ent_snn_no_amt is
  port (
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity ent_snn_no_amt;

architecture rtl of ent_snn_no_amt is
begin
  -- ERROR: missing shift amount (simple_expression) after shift_operator
  dout <= din sll;
end architecture rtl;
