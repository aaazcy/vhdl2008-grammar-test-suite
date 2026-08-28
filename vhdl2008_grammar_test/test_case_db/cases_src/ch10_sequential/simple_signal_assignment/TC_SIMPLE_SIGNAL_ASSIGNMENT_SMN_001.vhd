-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SSA_TYPE_MISMATCH
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Rule Description: Signal assignment expression must match the target signal type
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: SMN: simple_signal_assignment waveform type mismatches the target — in s_x <= true, true is boolean type, mismatching the integer type signal s_x
-- Expected Result: Triggers analysis error: can't match "true" with type integer
-- Dependencies: None
-- =============================================================
entity ssa_type_mismatch is port(y:out integer); end entity;
architecture vhdl2008 of ssa_type_mismatch is
  signal s_x:integer:=0;
begin
  s_x <= true;
  y <= s_x;
end architecture vhdl2008;
