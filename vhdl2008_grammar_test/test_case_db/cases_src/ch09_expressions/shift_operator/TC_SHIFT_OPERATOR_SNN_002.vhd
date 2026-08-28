-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Negative
-- Test Focus: SNN: misspelled shift_operator — "shl" used instead of "sll", verifying that shift_operator must be one of the 6 reserved words listed in the BNF (sll/srl/sla/sra/rol/ror), "shl" is not a legal shift operator
-- Expected Result: Triggers syntax error: "shl" is not a recognized shift_operator
-- Dependencies: None
-- =============================================================
entity ent_snn_bad_op is
  port (
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity ent_snn_bad_op;

architecture rtl of ent_snn_bad_op is
begin
  -- ERROR: "shl" is not a valid shift_operator (use "sll")
  dout <= din shl 2;
end architecture rtl;
