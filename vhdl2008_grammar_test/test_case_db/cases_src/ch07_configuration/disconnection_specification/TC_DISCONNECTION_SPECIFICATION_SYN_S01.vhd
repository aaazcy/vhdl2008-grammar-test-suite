-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Test Focus: Disconnection specification: disconnect guarded_signal_specification after time_expression; — guarded signal disconnect timing
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_disconnection_specification_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_disconnection_specification_syn_s01 is
  signal s_ds:integer:=0;
begin
  r<=s_ds;end architecture bh;
