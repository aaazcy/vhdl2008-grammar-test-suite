-- =============================================================
-- Case ID: TC_SEM_SUBP_004_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_004
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Rule Description: Procedure formal parameter names must be unique within the parameter list
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Procedure with duplicate formal parameter names
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_subp_004_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_subp_004_smn_002 is
  -- ERROR: duplicate parameter name "data" in procedure signature
  procedure p_dup(data:in integer; data:out integer) is
  begin
    null;
  end procedure;
begin
  p_dup(1, r);
end architecture bh;
