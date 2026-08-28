-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SNN_002
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Uses "range" keyword but the inner range is broken
--   (invalid direction keyword "until"). The range_constraint
--   production delegates to range, so a broken range propagates
--   the error up. Tests that both layers are checked.
-- Expected Result: VHDL syntax error at "until" in inner range
-- Dependencies: None
-- =============================================================
entity range_constraint_bad_inner is
end entity range_constraint_bad_inner;

architecture bad_inner_range of range_constraint_bad_inner is
  type t_base is range 0 to 255;
  -- ERROR: "until" is not a valid direction in the inner range
  subtype t_sub is t_base range 0 until 127;
  signal s : t_sub;
begin
end architecture bad_inner_range;
