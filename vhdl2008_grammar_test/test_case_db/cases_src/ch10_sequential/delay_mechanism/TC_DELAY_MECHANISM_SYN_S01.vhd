-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: DELAY_MECHANISM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Test Focus: Delay mechanism: transport ｜ [reject time_expression] inertial — all transport and inertial delay variants
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_delay_mechanism_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_delay_mechanism_syn_s01 is
  signal s_trans,s_inert:integer:=0;
begin
  s_trans<=transport 1 after 5 ns;
  s_inert<=1 after 3 ns;  -- inertial (default)
  r<=s_trans;end architecture bh;
