-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional_expressions: complex when-else chain with arithmetic expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_expr_syn4_ent is port(a,b:in integer; op:in integer range 0 to 3; y:out integer); end entity;
architecture bh of cond_expr_syn4_ent is
begin
  process(a,b,op) is
    variable v:integer;
  begin
    v := a+b when op=0 else a-b when op=1 else a*b when op=2 else 0;
    y<=v;
  end process;
end architecture bh;
