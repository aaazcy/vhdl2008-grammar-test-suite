-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_QUALIFIED_EXPRESSION_MATCH
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Rule Description: The expression inside a qualified expression must be of the type designated by the type_mark.
-- Error Category: Type mismatch
-- Test Focus: SMN: the type inside the qualified expression does not match the type_mark — in integer'(3.14) the real literal cannot be qualified as integer type
-- Expected Result: Triggers type error: expression type does not match type_mark in qualified expression
-- Dependencies: None
-- =============================================================

entity ent_qe_smn_001 is
  port (y : out integer);
end entity ent_qe_smn_001;

architecture mismatch of ent_qe_smn_001 is
begin
  -- ERROR: Cannot qualify real literal as integer
  y <= integer'(3.14);
end architecture mismatch;
