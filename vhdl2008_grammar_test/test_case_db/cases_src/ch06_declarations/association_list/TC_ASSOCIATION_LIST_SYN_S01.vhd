-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: Association list: association_element {, association_element} — mixed positional and named associations
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_association_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_association_list_syn_s01 is
begin
  r<=42;end architecture bh;
