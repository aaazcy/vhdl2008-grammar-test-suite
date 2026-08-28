-- =============================================================
-- Case ID: TC_SEM_SUBP_006_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_006
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Rule Description: A subprogram body must have a corresponding declaration if the declaration exists
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Subprogram body with no prior declaration (when declaration is required)
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_subp_006_smn_003 is port(r:out integer); end entity;
architecture bh of tc_sem_subp_006_smn_003 is
  -- Declaration exists but body signature mismatches
  function f_mismatch(x:integer) return integer;
  function f_mismatch(x:bit) return integer is
  begin return 0; end function;
begin
  -- ERROR: body signature doesn't match declaration
  r <= f_mismatch('0');
end architecture bh;
