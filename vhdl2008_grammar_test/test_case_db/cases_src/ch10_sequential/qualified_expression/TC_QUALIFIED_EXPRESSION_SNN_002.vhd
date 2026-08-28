-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SNN: tick without following expression - dangling tick
-- Expected Result: Triggers syntax error: missing expression after tick
-- Dependencies: None
-- =============================================================
entity qual_expr_snn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of qual_expr_snn2_ent is
  type t_my is range 0 to 255;
begin process(a) begin y<=t_my'; end process; end architecture bh;
