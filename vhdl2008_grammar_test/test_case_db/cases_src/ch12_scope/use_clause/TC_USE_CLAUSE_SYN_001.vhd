-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.3
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: Use clause with multiple libraries, multiple items and .all: std.standard.all + work.pkg.item + comma-separated multiple imports, verifying that the selected_name of a use_clause contains the three-level library.package.item path and the .all wildcard
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity uc_ent is port(a:in integer; y:out integer); end entity;
architecture bh of uc_ent is
  use std.standard.all;
  constant C_VAL:integer:=100;
begin y<=a+C_VAL; end architecture bh;
