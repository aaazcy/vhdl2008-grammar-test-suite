-- =============================================================
-- Case ID: TC_SEM_SEQ_025_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Rule Description: Force assignment is only valid in a process or subprogram (not in concurrent context)
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: Release signal used concurrently (outside process)
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity tc_sem_seq_025_smn_004 is port(r:out integer); end entity;
architecture bh of tc_sem_seq_025_smn_004 is
  signal s_target : integer := 0;
  signal s_clk : bit := '0';
begin
  -- ERROR: release used in concurrent context
  s_target <= release in 10 after 2 ns;
  s_clk <= not s_clk after 5 ns;
  r <= s_target;
end architecture bh;
