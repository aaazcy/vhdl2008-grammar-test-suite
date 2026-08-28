-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SNN_001
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Missing the "range" keyword before the range expression
--   in a subtype constraint. The BNF requires the keyword "range"
--   followed by the range nonterminal; omitting "range" is an error.
-- Expected Result: VHDL syntax error: expected "range" keyword
-- Dependencies: None
-- =============================================================
entity range_constraint_missing_range is
end entity range_constraint_missing_range;

architecture no_range_kw of range_constraint_missing_range is
  type t_base is range 0 to 255;
  -- ERROR: missing "range" keyword before range expression
  subtype t_sub is t_base 0 to 127;
  signal s : t_sub;
begin
end architecture no_range_kw;
