-- =============================================================
-- Case ID: TC_SEM_DRV_005_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_005
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Rule Description: Selected variable assignment choices must cover all possible values of the select expression
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: Selected variable assignment with incomplete coverage
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity tc_sem_drv_005_smn_001 is port(r:out integer); end entity;
architecture bh of tc_sem_drv_005_smn_001 is
  type t_stage is (INIT, PROC, DONE);
  signal s_stage : t_stage := INIT;
  signal s_result : integer := 0;
begin
  process(s_stage) is
    variable v_out : integer;
  begin
    -- ERROR: selected variable assignment missing PROC
    with s_stage select
      v_out := 0 when INIT,
              99 when DONE;
    s_result <= v_out;
  end process;
  r <= s_result;
end architecture bh;
