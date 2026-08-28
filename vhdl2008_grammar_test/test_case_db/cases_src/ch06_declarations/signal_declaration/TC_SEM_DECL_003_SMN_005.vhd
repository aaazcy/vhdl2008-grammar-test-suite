-- =============================================================
-- Case ID: TC_SEM_DECL_003_SMN_005
-- Rule Type: Semantic
-- Related Rule ID: SEM_DECL_003
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Rule Description: Register kind signal declaration is only permitted within a process statement
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Register signal declared in architecture body, not in process
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_decl_003_smn_005 is port(r:out integer); end entity;
architecture bh of tc_sem_decl_003_smn_005 is
  -- ERROR: register signal declared outside process
  signal s_reg : register integer := 0;
  signal s_val : integer := 0;
begin
  s_val <= s_reg;
  r <= s_val;
end architecture bh;
