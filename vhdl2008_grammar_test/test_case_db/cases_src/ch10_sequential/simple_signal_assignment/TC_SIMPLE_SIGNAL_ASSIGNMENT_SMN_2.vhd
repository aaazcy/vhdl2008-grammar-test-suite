-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SSA_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Rule Description: Signal assignment target type must match waveform type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: assigning integer literal to bit_vector signal
-- Expected Result: Triggers semantic error: type mismatch in signal assignment
-- Dependencies: None
-- =============================================================
entity ssa_sem1_ent is port(y:out integer); end entity;
architecture bh of ssa_sem1_ent is
  signal s_bv:bit_vector(7 downto 0);
begin
  s_bv<=42;
  y<=0;
end architecture bh;
