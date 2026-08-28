-- =============================================================
-- Case ID: TC_RANGE_SNN_001
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Range with missing direction keyword between two
--   simple_expressions. The BNF requires the direction nonterminal
--   between the expressions; omitting it is a parse error.
-- Expected Result: VHDL syntax error at the second expression
-- Dependencies: None
-- =============================================================
entity range_missing_direction is
end entity range_missing_direction;

architecture no_direction of range_missing_direction is
  -- ERROR: missing "to" or "downto" between expressions
  type t_bad is range 0 63;
  signal s : t_bad;
begin
end architecture no_direction;
