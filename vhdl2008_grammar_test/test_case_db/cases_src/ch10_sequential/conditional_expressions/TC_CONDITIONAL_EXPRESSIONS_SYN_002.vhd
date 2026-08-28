-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional_expressions: chained when-else with 3 conditions in variable assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_expr_syn2_ent is port(sel:in integer range 0 to 3; a,b,c,d:in integer; y:out integer); end entity;
architecture bh of cond_expr_syn2_ent is
begin
  process(sel,a,b,c,d) is
    variable v:integer;
  begin
    v := a when sel=0 else b when sel=1 else c when sel=2 else d;
    y<=v;
  end process;
end architecture bh;
