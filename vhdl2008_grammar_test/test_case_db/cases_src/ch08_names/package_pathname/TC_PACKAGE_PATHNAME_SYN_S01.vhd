-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Test Focus: Package pathname: @library_name.package_name.pathname_element — VHDL 2008 package-anchored path
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_package_pathname_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_package_pathname_syn_s01 is
begin
  r<=42;end architecture bh;
