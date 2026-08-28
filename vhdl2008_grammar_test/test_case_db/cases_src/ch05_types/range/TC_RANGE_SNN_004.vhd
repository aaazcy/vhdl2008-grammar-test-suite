-- =============================================================
-- Case ID: TC_RANGE_SNN_004
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Uses a direction keyword where a simple_expression is
--   expected in the first position of the expression form. The BNF
--   expects simple_expression first, then direction, then
--   simple_expression.
-- Expected Result: VHDL syntax error: direction in wrong position
-- Dependencies: None
-- =============================================================
entity range_direction_swapped is
end entity range_direction_swapped;

architecture dir_first of range_direction_swapped is
  -- ERROR: "to 0" puts direction before the first expression
  -- The BNF requires simple_expression direction simple_expression
  constant C : integer := to;
  type t_bad is range to 0 7;
  signal s : t_bad;
begin
end architecture dir_first;
