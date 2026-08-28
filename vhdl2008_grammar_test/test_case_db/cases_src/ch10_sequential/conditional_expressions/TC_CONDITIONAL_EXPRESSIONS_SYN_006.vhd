-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional_expressions: nested conditional expressions with comparison operators in conditions for priority encoder
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_expr_syn6_ent is port(pri:in integer range 0 to 7; y:out integer); end entity;
architecture bh of cond_expr_syn6_ent is
begin
  y <= 7 when pri>=4 and pri<8 else
       3 when pri>=2 and pri<4 else
       1 when pri=1            else
       0;
end architecture bh;
