-- =============================================================
-- Case ID: TC_SEM_SUBP_006_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_006
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Rule Description: A subprogram body must have a corresponding declaration if the declaration exists
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Subprogram declaration without corresponding body
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_subp_006_smn_004 is port(r:out integer); end entity;
architecture bh of tc_sem_subp_006_smn_004 is
  -- Declaration exists but no body provided
  function f_orphan(x:integer) return integer;
begin
  -- ERROR: f_orphan declared but never defined
  r <= f_orphan(5);
end architecture bh;
