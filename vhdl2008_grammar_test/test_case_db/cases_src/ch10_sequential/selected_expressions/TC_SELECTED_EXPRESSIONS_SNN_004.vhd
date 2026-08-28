-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SNN: orphaned choices without preceding expression — choices directly after comma without expression-when
-- Expected Result: Triggers syntax error: missing expression before when
-- Dependencies: None
-- =============================================================
entity sel_expr_snn4_ent is port(sel:in integer range 0 to 1; a,b:in integer; y:out integer); end entity;
architecture bh of sel_expr_snn4_ent is
begin process(sel,a,b) variable v:integer; begin with sel select v:=a when 0, when 1=>b; y<=v; end process; end architecture bh;
