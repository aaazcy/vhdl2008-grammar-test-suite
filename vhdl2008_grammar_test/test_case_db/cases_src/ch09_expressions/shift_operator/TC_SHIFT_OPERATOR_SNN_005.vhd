-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Negative
-- Test Focus: SNN: shift amount is not integer type — bit_vector used as the shift amount of sll, verifying that the shift amount on the right of shift_operator must be integer type, bit_vector cannot serve as the shift amount
-- Expected Result: Triggers semantic error: shift amount must be integer type, not array
-- Dependencies: None
-- =============================================================
entity ent_snn_bad_amount is
  port (
    din  : in  bit_vector(7 downto 0);
    cnt  : in  bit_vector(3 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity ent_snn_bad_amount;

architecture rtl of ent_snn_bad_amount is
begin
  -- ERROR: shift amount must be integer type, not bit_vector
  dout <= din sll cnt;
end architecture rtl;
