-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_COND_EXPR_BOOLEAN_COND
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SEM: condition expression evaluates to non-boolean type — integer compared with bit in when condition
-- Expected Result: Triggers semantic error: condition type mismatch
-- Dependencies: None
-- =============================================================
entity cond_expr_sem2_ent is port(a:in integer; flag:in bit; y:out integer); end entity;
architecture bh of cond_expr_sem2_ent is
begin process(flag,a) variable v:integer; begin v:=a when a=flag else 0; y<=v; end process; end architecture bh;
