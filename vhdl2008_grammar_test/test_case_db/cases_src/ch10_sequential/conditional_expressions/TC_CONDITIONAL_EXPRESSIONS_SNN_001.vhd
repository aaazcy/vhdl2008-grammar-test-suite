-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SNN: missing "when" keyword - expression without when after first clause
-- Expected Result: Triggers syntax error: missing when
-- Dependencies: None
-- =============================================================
entity cond_expr_snn1_ent is port(sel:in bit; a,b:in integer; y:out integer); end entity;
architecture bh of cond_expr_snn1_ent is
begin process(sel,a,b) variable v:integer; begin v:=a sel='1' else b; y<=v; end process; end architecture bh;
