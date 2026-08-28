-- =============================================================
-- Case ID: TC_SEM_DRV_003_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_003
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Rule Description: Selected signal assignment choices must cover all possible values of the select expression
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: Selected signal assignment with integer select, only partial range
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity tc_sem_drv_003_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_drv_003_smn_002 is
  signal s_cnt : integer range 0 to 3 := 0;
  signal s_out : integer := 0;
begin
  -- ERROR: only 0 and 1 covered, 2 and 3 uncovered
  with s_cnt select
    s_out <= 0 when 0,
             1 when 1;
  r <= s_out;
end architecture bh;
