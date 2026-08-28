-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SNN: invalid conditional expressions - else without following expression
-- Expected Result: Triggers syntax error: missing expression after else
-- Dependencies: None
-- =============================================================
entity cond_expr_snn2_ent is port(sel:in bit; a:in integer; y:out integer); end entity;
architecture bh of cond_expr_snn2_ent is
begin process(sel,a) variable v:integer; begin v:=a when sel='1' else; y<=v; end process; end architecture bh;
