-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SNN: missing "(" — integer'42) lacks the left parenthesis; a qualified expression requires the expression or aggregate to be parenthesized
-- Expected Result: Triggers syntax error: missing opening parenthesis after tick
-- Dependencies: None
-- =============================================================

entity ent_qe_snn_002 is
  port (y : out integer);
end entity ent_qe_snn_002;

architecture miss_lparen of ent_qe_snn_002 is
begin
  -- ERROR: Missing '(' — expression must be parenthesized
  y <= integer'42);
end architecture miss_lparen;
