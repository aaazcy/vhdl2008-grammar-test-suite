-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional_expressions: used in concurrent conditional signal assignment with two when-else branches generating PWM threshold
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_expr_syn5_ent is port(sel:in integer range 0 to 3; val:in integer; y:out integer); end entity;
architecture bh of cond_expr_syn5_ent is
begin
  y <= val   when sel=0 else
       val*2 when sel=1 else
       val/2 when sel=2 else
       0;
end architecture bh;
