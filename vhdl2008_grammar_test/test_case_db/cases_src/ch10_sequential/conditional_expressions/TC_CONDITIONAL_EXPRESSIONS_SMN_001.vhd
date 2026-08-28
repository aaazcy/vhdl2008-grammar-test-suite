-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_COND_EXPR_TYPE_CONSISTENCY
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SMN: all branch expressions must have compatible types — integer vs string mixed in when-else branches
-- Expected Result: Triggers type error: incompatible types in conditional expression branches
-- Dependencies: None
-- =============================================================
entity cond_expr_smn1_ent is port(sel:in integer; a:in integer; y:out integer); end entity;
architecture bh of cond_expr_smn1_ent is
begin process(sel,a) variable v:integer; begin v:=a when sel=0 else "hello"; y<=v; end process; end architecture bh;
