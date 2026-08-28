-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.2.3
-- Test Focus: Discrete range: discrete_subtype_indication ｜ range_attribute_name ｜ simple_expression direction simple_expression
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_discrete_range_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_discrete_range_syn_s01 is
  type t_dr is (A,B,C,D,E); signal s_dr:t_dr:=A; signal s_res:integer:=0;
begin
  g1: for i in 0 to 7 generate s_res<=s_res+i; end generate;
  g2: for letter in A to C generate s_res<=s_res+1; end generate; r<=s_res;end architecture bh;
