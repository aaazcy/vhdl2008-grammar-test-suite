-- =============================================================
-- Case ID: TC_SELECTED_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Negative
-- Test Focus: SNN: dot selection on a non-record type——s_bit.field applies selected_name syntax to a signal of type bit; bit is not a record type and has no field suffix that can be accessed
-- Expected Result: Triggers semantic error (non-record type selected_name)
-- Dependencies: None
-- =============================================================
entity sel_name_non_record is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of sel_name_non_record is
  signal s_bit : bit := '0';
begin
  -- ERROR: bit is not a record type, cannot have field suffix
  q <= s_bit.field;
end architecture vhdl2008;
