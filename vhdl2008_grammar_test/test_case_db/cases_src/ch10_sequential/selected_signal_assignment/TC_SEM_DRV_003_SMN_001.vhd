-- =============================================================
-- Case ID: TC_SEM_DRV_003_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_003
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Rule Description: Selected signal assignment choices must cover all possible values of the select expression
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: Selected signal assignment with incomplete enumeration coverage
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity tc_sem_drv_003_smn_001 is port(r:out integer); end entity;
architecture bh of tc_sem_drv_003_smn_001 is
  type t_sel is (A, B, C);
  signal s_sel : t_sel := A;
  signal s_out : integer := 0;
begin
  -- ERROR: selected assignment missing C
  with s_sel select
    s_out <= 1 when A,
             2 when B;
  r <= s_out;
end architecture bh;
