-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Negative
-- Test Focus: SNN: missing ")" — integer(a lacks the right parenthesis closing the type conversion expression
-- Expected Result: Triggers syntax error: missing closing parenthesis in type conversion
-- Dependencies: None
-- =============================================================

entity ent_tc_snn_002 is
  port (a : in integer);
end entity ent_tc_snn_002;

architecture miss_rparen of ent_tc_snn_002 is
  signal s : integer;
begin
  -- ERROR: Missing ')' — unclosed type conversion
  s <= integer(a;
end architecture miss_rparen;
