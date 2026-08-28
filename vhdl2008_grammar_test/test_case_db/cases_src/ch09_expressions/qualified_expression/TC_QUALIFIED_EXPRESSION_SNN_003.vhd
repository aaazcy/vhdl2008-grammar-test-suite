-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SNN: missing ")" — integer'(42 lacks the closing right parenthesis
-- Expected Result: Triggers syntax error: missing closing parenthesis in qualified expression
-- Dependencies: None
-- =============================================================

entity ent_qe_snn_003 is
  port (y : out integer);
end entity ent_qe_snn_003;

architecture miss_rparen of ent_qe_snn_003 is
begin
  -- ERROR: Missing ')' — unclosed qualified expression
  y <= integer'(42;
end architecture miss_rparen;
