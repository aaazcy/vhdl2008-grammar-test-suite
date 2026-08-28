-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Test Focus: Group declaration: group identifier : group_template_name (group_constituent_list);
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_group_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_group_declaration_syn_s01 is
begin
  r<=42;end architecture bh;
