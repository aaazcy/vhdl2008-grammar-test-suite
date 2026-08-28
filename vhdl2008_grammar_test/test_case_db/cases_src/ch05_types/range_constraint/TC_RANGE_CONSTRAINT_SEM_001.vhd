-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SEM_001
-- Related Rule ID: SEM_RANGE_CO_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Range constraint whose bounds fall outside the base
--   type's bounds (range -10 to 10 on a base type range 0 to 255).
--   This violates the constraint compatibility rules: the constraint
--   must be a subset of the base type range.
-- Expected Result: Compilation error: constraint not compatible
-- Dependencies: None
-- =============================================================
entity range_constraint_out_of_bounds is
end entity range_constraint_out_of_bounds;

architecture constraint_oob of range_constraint_out_of_bounds is
  type t_base is range 0 to 255;
  -- ERROR: -10 is outside the base type range 0 to 255
  subtype t_oob is t_base range -10 to 10;
  signal s : t_oob;
begin
end architecture constraint_oob;
