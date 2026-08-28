-- =============================================================
-- Case ID: TC_USE_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: SNN: use_clause missing the selected_name - 'use;' has a semicolon directly after the keyword with no name, verifying selected_name is an essential component of use_clause
-- Expected Result: Triggers syntax error: an identifier is expected instead of ';'
-- Dependencies: None
-- =============================================================
use;
entity uc_ent is end entity;
