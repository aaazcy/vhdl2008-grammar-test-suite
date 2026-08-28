-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SNN: tick after a non-type name — a signal name before the tick is not a legal qualified expression; before ' there must be a type_mark, not a variable name
-- Expected Result: Triggers syntax error: qualified expression requires type_mark before tick
-- Dependencies: None
-- =============================================================

entity ent_qe_snn_005 is
  port (v : in integer);
end entity ent_qe_snn_005;

architecture non_type of ent_qe_snn_005 is
  signal s : integer;
begin
  -- ERROR: 's' is not a type mark — cannot be used before tick
  s <= s'(42);
end architecture non_type;
