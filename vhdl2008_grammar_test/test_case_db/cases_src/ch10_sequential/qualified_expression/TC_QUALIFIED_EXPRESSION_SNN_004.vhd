-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SNN: qualified expression with invalid type_mark — undefined type name used before tick
-- Expected Result: Triggers semantic error: undefined type_mark
-- Dependencies: None
-- =============================================================
entity qual_expr_snn4_ent is port(a:in integer; y:out integer); end entity;
architecture bh of qual_expr_snn4_ent is
begin process(a) begin y<=undefined_type'(a); end process; end architecture bh;
