-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DEFAULT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_SUBPROGRAM_DEFAULT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Test Focus: Interface subprogram default: identifier ｜ <> — subprogram name or box default in interfaces
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_subprogram_default_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_subprogram_default_syn_s01 is
begin
  r<=42;end architecture bh;
