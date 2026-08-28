-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Test Focus: SNN: library_clause missing the logical_name - 'library;' has a semicolon directly after the keyword with no library name, verifying logical_name_list must not be empty
-- Expected Result: Triggers syntax error: an identifier is expected instead of ';'
-- Dependencies: None
-- =============================================================
library;
entity lb1_ent is end entity;
