-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_COND_EXPR_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: All expressions in conditional_expressions must have same base type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: type mismatch - integer vs bit_vector in different when branches
-- Expected Result: Triggers semantic error: type mismatch in conditional expression branches
-- Dependencies: None
-- =============================================================
entity cond_expr_sem1_ent is port(sel:in bit; a:in integer; b:in bit_vector(7 downto 0); y:out integer); end entity;
architecture bh of cond_expr_sem1_ent is
begin process(sel,a,b) variable v:integer; begin v:=a when sel='1' else b; y<=v; end process; end architecture bh;
