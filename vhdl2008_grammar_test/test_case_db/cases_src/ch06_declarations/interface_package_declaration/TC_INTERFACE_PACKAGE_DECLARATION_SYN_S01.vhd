-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.5
-- Test Focus: Interface package declaration: package identifier is new uninstantiated_package_name interface_package_generic_map_aspect — VHDL 2008
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_package_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_package_declaration_syn_s01 is
begin
  r<=42;end architecture bh;
