-- =============================================================
-- Case ID: TC_SIMPLE_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SIMPLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Test Focus: Simple name: identifier — basic unqualified identifier reference
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_simple_name_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_simple_name_syn_s01 is
  signal s_sn:integer:=42;
begin
  r<=s_sn;end architecture bh;
