-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Test Focus: Package header: [generic_clause [generic_map_aspect;]] — VHDL 2008 generic packages
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_package_header_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_package_header_syn_s01 is
begin
  r<=42;end architecture bh;
