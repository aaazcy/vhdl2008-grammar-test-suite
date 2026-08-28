-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Negative
-- Test Focus: SNN: missing "(" — in integer a), the left parenthesis is missing after the type_mark, so it is not legal type conversion syntax
-- Expected Result: Triggers syntax error: missing opening parenthesis after type_mark
-- Dependencies: None
-- =============================================================

entity ent_tc_snn_001 is
  port (a : in integer);
end entity ent_tc_snn_001;

architecture miss_lparen of ent_tc_snn_001 is
  signal s : integer;
begin
  -- ERROR: Missing '(' after type_mark in type conversion
  s <= integer a);
end architecture miss_lparen;
