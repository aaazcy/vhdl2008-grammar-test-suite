-- =============================================================
-- Case ID: TC_SEM_TYPE_009_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_009
-- Standard Reference: IEEE 1076-2008 Section 5.2.3
-- Rule Description: Integer type range bounds must be locally static expressions
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: Integer type with non-static range bound (signal reference)
-- Expected Result: Triggers semantic error: type_mismatch
-- Dependencies: None
-- =============================================================
entity tc_sem_type_009_smn_001 is port(r:out integer); end entity;
architecture bh of tc_sem_type_009_smn_001 is
  signal s_limit : integer := 100;
  -- ERROR: range bound depends on non-static signal
  type t_bad_int is range 0 to s_limit;
  signal s_val : t_bad_int;
begin
  s_val <= 50;
  r <= 1;
end architecture bh;
