-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SNN: wrong type_mark — an undefined type name serves as the type_mark; a qualified expression requires a visible type mark
-- Expected Result: Triggers semantic error: type_mark 'undefined_type' is not a valid type
-- Dependencies: None
-- =============================================================

entity ent_qe_snn_004 is
  port (y : out integer);
end entity ent_qe_snn_004;

architecture bad_mark of ent_qe_snn_004 is
begin
  -- ERROR: 'undefined_type' is not a known type mark
  y <= undefined_type'(42);
end architecture bad_mark;
