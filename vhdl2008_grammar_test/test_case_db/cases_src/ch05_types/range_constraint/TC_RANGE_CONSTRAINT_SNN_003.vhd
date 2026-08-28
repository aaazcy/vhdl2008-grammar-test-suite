-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SNN_003
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Duplicated "range" keyword (range range range). The
--   BNF expects exactly one "range" keyword followed by one range.
--   A second "range" in the expression position is invalid.
-- Expected Result: VHDL syntax error: unexpected "range"
-- Dependencies: None
-- =============================================================
entity range_constraint_double_range is
end entity range_constraint_double_range;

architecture double_range_kw of range_constraint_double_range is
  type t_base is range 0 to 255;
  -- ERROR: double "range" keyword
  subtype t_sub is t_base range range 0 to 127;
  signal s : t_sub;
begin
end architecture double_range_kw;
