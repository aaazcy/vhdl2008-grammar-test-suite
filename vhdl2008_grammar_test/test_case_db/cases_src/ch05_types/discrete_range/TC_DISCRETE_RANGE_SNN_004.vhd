-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Negative
-- Test Focus: SNN: range form of discrete_range missing the direction keyword - in 'integer range 0 7' the left and right bounds lack "to"/"downto" between them, verifying the range form requires simple_expression direction simple_expression
-- Expected Result: Triggers syntax error: 'to' or 'downto' expected
-- Dependencies: None
-- =============================================================
entity dr15_ent is end entity;
architecture rtl of dr15_ent is
  subtype t_bad is integer range 0 7;
begin
end architecture;
