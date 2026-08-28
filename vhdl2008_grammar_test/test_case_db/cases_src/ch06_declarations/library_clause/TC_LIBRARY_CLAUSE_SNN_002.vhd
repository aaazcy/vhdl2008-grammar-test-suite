-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Test Focus: SNN: logical_name of library_clause containing an illegal character - the library name 'lib-dollar-test' contains '-', which is not a legal identifier, verifying logical_name must be a legal identifier
-- Expected Result: Triggers syntax error: missing ";" at end of library clause
-- Dependencies: None
-- =============================================================
library lib-dollar-test;
entity lb2_ent is end entity;
