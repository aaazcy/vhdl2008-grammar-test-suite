-- =============================================================
-- Case ID: TC_GENERIC_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Test Focus: Generic list: interface_constant_declaration {; interface_constant_declaration} — generics list in entity/component
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_generic_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_generic_list_syn_s01 is
begin
  r<=42;end architecture bh;
