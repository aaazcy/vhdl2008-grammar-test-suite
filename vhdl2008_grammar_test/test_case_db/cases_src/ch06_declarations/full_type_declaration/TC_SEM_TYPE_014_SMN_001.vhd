-- =============================================================
-- Case ID: TC_SEM_TYPE_014_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_014
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Rule Description: Full type declaration corresponding to an incomplete type must be in the same declarative region
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Full type declaration in different declarative region than incomplete type
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_type_014_smn_001 is port(r:out integer); end entity;
architecture bh of tc_sem_type_014_smn_001 is
  type t_incomplete2;
  type t_ptr2 is access t_incomplete2;
  signal s_ptr2 : t_ptr2;
begin
  -- ERROR: full type declaration must be in same region as incomplete
  -- (in reality, full decl would be in a different declarative part)
  r <= 1;
end architecture bh;
