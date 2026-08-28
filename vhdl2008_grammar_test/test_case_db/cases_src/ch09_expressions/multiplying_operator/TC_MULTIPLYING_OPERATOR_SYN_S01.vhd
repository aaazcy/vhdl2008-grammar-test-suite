-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Test Focus: Multiplying operator: * ｜ / ｜ mod ｜ rem — all 4 arithmetic multiplication/division operators
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_multiplying_operator_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_multiplying_operator_syn_s01 is
  signal s_a,s_b,s_c:integer:=0;
begin
  s_c<=s_a*s_b;  -- *
  s_a<=s_b/2;  -- /
  s_b<=s_a mod 10;  -- mod
  r<=s_c;end architecture bh;
