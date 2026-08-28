-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library identifier { , identifier } ;
-- Case Type: Positive
-- Test Focus: Library clause multi-library import: library work,std,ieee imports three libraries at once, verifying library_clause can contain multiple comma-separated library identifiers
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library work;
library std;
entity lc_ent is port(a:in integer; y:out integer); end entity;
architecture bh of lc_ent is
  use std.standard.all;
begin y<=a; end architecture bh;
