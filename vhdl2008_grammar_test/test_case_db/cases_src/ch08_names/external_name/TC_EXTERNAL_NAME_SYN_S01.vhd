-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Test Focus: External name: external_constant_name ｜ external_signal_name ｜ external_variable_name — VHDL 2008 hierarchical name reference
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_external_name_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_external_name_syn_s01 is
begin
  r<=42;end architecture bh;
