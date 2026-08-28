-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Test Focus: Library clause: library identifier {, identifier}; — makes design libraries visible
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_library_clause_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_library_clause_syn_s01 is
begin
  r<=42;end architecture bh;
