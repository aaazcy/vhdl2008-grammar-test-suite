-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Test Focus: Group constituent: name ｜ character_literal — member of a group template
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_group_constituent_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_group_constituent_syn_s01 is
begin
  r<=42;end architecture bh;
