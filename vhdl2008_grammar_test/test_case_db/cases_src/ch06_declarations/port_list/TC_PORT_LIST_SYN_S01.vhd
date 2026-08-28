-- =============================================================
-- Case ID: TC_PORT_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PORT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Test Focus: Port list: interface_signal_declaration {; interface_signal_declaration} — port declarations list
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_port_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_port_list_syn_s01 is
begin
  r<=42;end architecture bh;
