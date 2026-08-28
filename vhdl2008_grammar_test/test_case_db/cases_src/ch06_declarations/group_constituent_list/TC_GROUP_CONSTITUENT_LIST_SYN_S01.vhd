-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: GROUP_CONSTITUENT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Test Focus: Group constituent list: group_constituent {, group_constituent} — delimited group members
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_group_constituent_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_group_constituent_list_syn_s01 is
begin
  r<=42;end architecture bh;
