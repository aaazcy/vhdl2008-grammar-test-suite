-- =============================================================
-- Case ID: TC_SEM_SCOPE_003_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SCOPE_003
-- Standard Reference: IEEE 1076-2008 Section 12.3
-- Rule Description: Two declarations with the same identifier must not occur in the same declarative region
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Duplicate identifier: signal and variable in same process
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_scope_003_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_scope_003_smn_002 is
  signal s_shared : integer := 0;
  signal s_result : integer := 0;
begin
  -- ERROR: variable name conflicts with signal in same scope
  process is
    variable s_shared : integer := 99;
  begin
    s_result <= s_shared;
    wait;
  end process;
  r <= s_result;
end architecture bh;
