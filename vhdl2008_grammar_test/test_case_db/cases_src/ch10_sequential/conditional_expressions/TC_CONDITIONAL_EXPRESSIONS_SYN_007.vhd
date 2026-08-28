-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional_expressions: in VHDL 2008 conditional variable assignment context with signal assignment and boolean signal condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_expr_syn7_ent is port(en:in bit; src:in integer; y:out integer); end entity;
architecture bh of cond_expr_syn7_ent is
  signal s_reg:integer:=0;
begin
  process(en, src) is
    variable v_tmp:integer;
  begin
    v_tmp := src when en='1' else s_reg;
    s_reg <= v_tmp;
    y <= v_tmp;
  end process;
end architecture bh;
