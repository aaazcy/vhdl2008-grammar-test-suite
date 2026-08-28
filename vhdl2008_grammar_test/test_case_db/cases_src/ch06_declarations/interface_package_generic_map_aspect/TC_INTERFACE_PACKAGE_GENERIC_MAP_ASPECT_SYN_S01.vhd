-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_PACKAGE_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.5
-- Test Focus: Interface package generic map: generic map (association_list) ｜ generic map (default) — VHDL 2008
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_package_generic_map_aspect_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_package_generic_map_aspect_syn_s01 is
begin
  r<=42;end architecture bh;
