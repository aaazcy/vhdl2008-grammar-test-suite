-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Negative
-- Test Focus: SNN: type conversion applied to an aggregate — integer((a,b)) attempts to convert an aggregate to a scalar, and an aggregate is not a convertible expression
-- Expected Result: Triggers syntax error: cannot convert aggregate — aggregate is not convertible
-- Dependencies: None
-- =============================================================

entity ent_tc_snn_005 is
  port (a, b : in integer);
end entity ent_tc_snn_005;

architecture agg_conv of ent_tc_snn_005 is
  signal s : integer;
begin
  -- ERROR: Aggregate cannot be used as expression in type conversion
  s <= integer((a, b));
end architecture agg_conv;
