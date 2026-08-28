-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Test Focus: Concurrent selected signal assignment: with expression select target <= selected_waveforms; — case-like concurrent drive
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_concurrent_selected_signal_assignment_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_concurrent_selected_signal_assignment_syn_s01 is
  signal s_cssa:integer range 0 to 1:=0;
begin
  with s_cssa select r<= 0 when 0, 1 when 1;end architecture bh;
