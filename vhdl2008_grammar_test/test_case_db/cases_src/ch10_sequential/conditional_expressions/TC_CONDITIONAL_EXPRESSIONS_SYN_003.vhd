-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional_expressions: with conditional force assignment using when-else chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_expr_syn3_ent is port(mode:in integer range 0 to 2; val:in integer; y:out integer); end entity;
architecture bh of cond_expr_syn3_ent is
  signal s_targ:integer:=0;
begin
  process(mode,val) is
  begin
    s_targ <= val when mode=0 else 0 when mode=1 else val*2;
  end process;
  y<=s_targ;
end architecture bh;
