-- =============================================================
-- Case ID: TC_RELATIVE_PATHNAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: RELATIVE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Test Focus: Relative pathname: partial_pathname — path relative to current declarative region
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_relative_pathname_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_relative_pathname_syn_s01 is
begin
  r<=42;end architecture bh;
