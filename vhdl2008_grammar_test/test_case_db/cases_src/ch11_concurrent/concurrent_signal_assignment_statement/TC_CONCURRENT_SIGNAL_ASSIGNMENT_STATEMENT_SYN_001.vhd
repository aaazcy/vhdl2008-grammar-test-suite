-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] concurrent_simple_signal_assignment | concurrent_conditional_signal_assignment | concurrent_selected_signal_assignment
-- Case Type: Positive
-- Test Focus: all 3 forms of concurrent assignment: simple (unconditional s_c<=a+b)/conditional (when-else chain s_cond<=1 when a>b else 0)/selected (with-select s_sel<=...), with the 3 kinds of concurrent_signal_assignment coexisting in the same architecture statement region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_ent is port(a,b:in integer; sel:in integer range 0 to 2; y1,y2,y3:out integer); end entity;
architecture bh of csa_ent is
  signal s_c,s_cond,s_sel:integer:=0;
begin
  s_c<=a+b;
  s_cond<=10 when a>b else -10 when a<b else 0;
  with sel select s_sel<= 100 when 0, 200 when 1, 300 when 2;
  y1<=s_c; y2<=s_cond; y3<=s_sel;
end architecture bh;
