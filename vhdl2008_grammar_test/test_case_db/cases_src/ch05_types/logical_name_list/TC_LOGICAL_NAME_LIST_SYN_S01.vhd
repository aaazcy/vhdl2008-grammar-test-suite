-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5
-- Test Focus: Logical name list: logical_name {, logical_name}
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_logical_name_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_logical_name_list_syn_s01 is
    signal s_lnl:integer:=0;
begin
  s_lnl<=1; r<=s_lnl;end architecture bh;
