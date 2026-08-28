-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SNN: missing "'" (tick) — integer(42) is missing the mandatory apostrophe after the type_mark, so it is not a legal qualified expression
-- Expected Result: Triggers syntax error: missing tick (') after type_mark in qualified expression
-- Dependencies: None
-- =============================================================

entity ent_qe_snn_001 is
  port (y : out integer);
end entity ent_qe_snn_001;

architecture miss_tick of ent_qe_snn_001 is
begin
  -- ERROR: Missing tick (') — looks like a type conversion, not qualified expression
  y <= integer(42)';
end architecture miss_tick;
