-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.3
-- Test Focus: Use clause: use selected_name {, selected_name}; — library/package visibility import with all, item, multiple imports
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_use_clause_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_use_clause_syn_s01 is
  use std.standard.all;
begin
  r<=42;end architecture bh;
