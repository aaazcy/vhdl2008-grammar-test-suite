-- =============================================================
-- Case ID: TC_SEM_TYPE_009_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_009
-- Standard Reference: IEEE 1076-2008 Section 5.2.3
-- Rule Description: Integer type range bounds must be expressions over names that are visible and declared
-- Case Type: Negative
-- Error Category: undeclared_identifier
-- Test Focus: Integer type with an undeclared range bound — the upper bound LIMIT_GHOST of 'range 0 to LIMIT_GHOST' has never been declared, so the integer type definition cannot be resolved
-- Expected Result: Triggers semantic error: no declaration for "limit_ghost"
-- Dependencies: None
-- =============================================================
entity itd29b_ent is end entity;
architecture rtl of itd29b_ent is
  type t_bad_int2 is range 0 to LIMIT_GHOST;
begin
end architecture;
