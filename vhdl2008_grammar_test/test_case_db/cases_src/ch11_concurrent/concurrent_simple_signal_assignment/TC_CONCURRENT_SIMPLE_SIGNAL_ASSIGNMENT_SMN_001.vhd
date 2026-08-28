-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CSSIMP_TYPE
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: Concurrent simple signal assignment expression must match the target type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: waveform type of a concurrent simple signal assignment mismatches the target——in s_x <= true, true is of boolean type and mismatches the integer type signal s_x
-- Expected Result: Triggers analysis error: can't match "true" with type integer
-- Dependencies: None
-- =============================================================
entity cssimp_type_mismatch is port(y:out integer); end entity;
architecture vhdl2008 of cssimp_type_mismatch is
  signal s_x:integer:=0;
begin
  s_x <= true;
  y<=s_x;
end architecture vhdl2008;
