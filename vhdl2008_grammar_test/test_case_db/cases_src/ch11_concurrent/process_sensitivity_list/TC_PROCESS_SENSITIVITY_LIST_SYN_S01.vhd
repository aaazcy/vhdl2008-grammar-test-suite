-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Test Focus: Process sensitivity list: all ｜ signal_name {, signal_name} — VHDL 2008 "all" keyword and explicit signal sensitivity
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_process_sensitivity_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_process_sensitivity_list_syn_s01 is
  signal s_psl,s_out:integer:=0;
begin
  p_all:process(all) is begin
    s_out<=s_psl+1;
  end process;
  r<=s_out;end architecture bh;
