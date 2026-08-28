-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Test Focus: Absolute pathname: . partial_pathname — root-anchored external name path for VHDL 2008 external names
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_absolute_pathname_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_absolute_pathname_syn_s01 is
begin
  r<=42;end architecture bh;
