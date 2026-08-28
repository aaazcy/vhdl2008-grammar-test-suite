-- =============================================================
-- Case ID: TC_SEM_SCOPE_003_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SCOPE_003
-- Standard Reference: IEEE 1076-2008 Section 12.3
-- Rule Description: Two declarations with the same identifier must not occur in the same declarative region
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Duplicate identifier: type and signal in same declarative region
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_scope_003_smn_001 is port(r:out integer); end entity;
architecture bh of tc_sem_scope_003_smn_001 is
  type t_item is range 0 to 100;
  -- ERROR: constant uses same name as existing type
  constant t_item : integer := 42;
  signal s_val : integer := 0;
begin
  s_val <= t_item;
  r <= s_val;
end architecture bh;
