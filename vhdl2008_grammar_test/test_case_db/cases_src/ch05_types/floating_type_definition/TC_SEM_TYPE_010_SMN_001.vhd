-- =============================================================
-- Case ID: TC_SEM_TYPE_010_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_010
-- Standard Reference: IEEE 1076-2008 Section 5.2.5
-- Rule Description: Floating type range bounds must be expressions over names that are visible and declared
-- Case Type: Negative
-- Error Category: undeclared_identifier
-- Test Focus: Floating type with an undeclared range bound — the upper bound LIMIT_GHOST of 'range 0.0 to LIMIT_GHOST' has never been declared, so the floating type definition cannot be resolved
-- Expected Result: Triggers semantic error: no declaration for "limit_ghost"
-- Dependencies: None
-- =============================================================
entity fl23_ent is end entity;
architecture rtl of fl23_ent is
  type t_bad_float is range 0.0 to LIMIT_GHOST;
begin
end architecture;
