-- =============================================================
-- Case ID: TC_SEM_DRV_005_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_005
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Rule Description: Selected variable assignment choices must cover all possible values of the select expression
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: Selected variable assignment: duplicate choice value
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity tc_sem_drv_005_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_drv_005_smn_002 is
  type t_lvl is (LOW, MID, HIGH);
  signal s_lvl : t_lvl := LOW;
  signal s_result : integer := 0;
begin
  process(s_lvl) is
    variable v_out : integer;
  begin
    -- ERROR: LOW appears twice in choices
    with s_lvl select
      v_out := 0 when LOW,
              1 when LOW,
              2 when HIGH;
    s_result <= v_out;
  end process;
  r <= s_result;
end architecture bh;
