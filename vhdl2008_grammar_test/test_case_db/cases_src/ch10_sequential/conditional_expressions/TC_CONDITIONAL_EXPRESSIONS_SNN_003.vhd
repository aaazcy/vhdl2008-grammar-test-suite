-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SNN: condition is not boolean — integer value used directly as condition in when clause
-- Expected Result: Triggers type error: when condition must be boolean
-- Dependencies: None
-- =============================================================
entity cond_expr_snn3_ent is port(sel:in integer; a,b:in integer; y:out integer); end entity;
architecture bh of cond_expr_snn3_ent is
begin process(sel,a,b) variable v:integer; begin v:=a when sel else b; y<=v; end process; end architecture bh;
