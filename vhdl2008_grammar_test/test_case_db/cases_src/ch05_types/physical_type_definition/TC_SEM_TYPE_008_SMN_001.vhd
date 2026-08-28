-- =============================================================
-- Case ID: TC_SEM_TYPE_008_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_008
-- Standard Reference: IEEE 1076-2008 Section 5.2.4
-- Rule Description: Primary unit declaration in physical type must be a valid identifier; the units list must contain a primary unit
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Physical type whose units list is empty — 'units ... end units;' declares no primary unit at all, but every physical type definition requires a primary unit identifier
-- Expected Result: Triggers syntax error: an identifier is expected instead of 'end'
-- Dependencies: None
-- =============================================================
entity ph31_ent is end entity;
architecture rtl of ph31_ent is
  type t_bad_phys is range 0 to 1000 units
  end units;
begin
end architecture;
