-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_CSSIMP_TYPE
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: Waveform type must match target in concurrent simple assignment
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: assigning bit_vector literal to integer signal in concurrent assignment
-- Expected Result: Triggers semantic error: type mismatch
-- Dependencies: None
-- =============================================================
entity cssimp_sem1_ent is port(y:out integer); end entity;
architecture bh of cssimp_sem1_ent is
  signal s_i:integer:=0;
begin
  s_i <= X"FF";
  y<=s_i;
end architecture bh;
