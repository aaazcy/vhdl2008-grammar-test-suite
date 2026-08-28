-- =============================================================
-- Case ID: TC_SEM_TYPE_013_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_013
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Rule Description: An incomplete type declaration must have a corresponding full type declaration in the same declarative region
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Incomplete type without full type declaration
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_type_013_smn_001 is port(r:out integer); end entity;
architecture bh of tc_sem_type_013_smn_001 is
  type t_incomplete;  -- incomplete type declaration
  -- ERROR: no full type declaration for t_incomplete in this region
  type t_ptr is access t_incomplete;
  signal s_ptr : t_ptr;
begin
  -- ERROR: t_incomplete never fully declared
  r <= 1;
end architecture bh;
