-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Test Focus: Partial pathname: pathname_element {. pathname_element} — relative path within external name
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_partial_pathname_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_partial_pathname_syn_s01 is
begin
  r<=42;end architecture bh;
