-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Test Focus: Sensitivity list: signal_name {, signal_name} — process and wait sensitivity signal list
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_sensitivity_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_sensitivity_list_syn_s01 is
  signal s_sl1,s_sl2:bit:='0'; signal s_res:integer:=0;
begin
  p_sens:process(s_sl1,s_sl2) is begin
    s_res<=s_res+1; end process;
  r<=s_res;end architecture bh;
