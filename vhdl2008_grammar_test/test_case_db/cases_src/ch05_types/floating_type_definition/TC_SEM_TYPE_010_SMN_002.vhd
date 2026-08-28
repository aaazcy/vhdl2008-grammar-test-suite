-- =============================================================
-- Case ID: TC_SEM_TYPE_010_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_010
-- Standard Reference: IEEE 1076-2008 Section 5.2.5
-- Rule Description: Floating type range bounds must belong to the same type class
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: Floating type with mixed-class bounds — 'range 10.0 to 0' uses a real left bound and an integer right bound; the bounds of one floating type range must be of the same type class
-- Expected Result: Triggers semantic error: left and right bounds must be of the same type class
-- Dependencies: None
-- =============================================================
entity fl24_ent is end entity;
architecture rtl of fl24_ent is
  type t_bad_float2 is range 10.0 to 0;
begin
end architecture;
