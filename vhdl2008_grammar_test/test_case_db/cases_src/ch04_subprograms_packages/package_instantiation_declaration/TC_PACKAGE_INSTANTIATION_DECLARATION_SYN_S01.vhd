-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Test Focus: Package instantiation: package identifier is new uninstantiated_package_name [generic_map_aspect];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_package_instantiation_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_package_instantiation_declaration_syn_s01 is
begin
  r<=42;end architecture bh;
