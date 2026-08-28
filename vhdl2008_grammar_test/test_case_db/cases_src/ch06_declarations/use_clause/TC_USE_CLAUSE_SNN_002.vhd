-- =============================================================
-- Case ID: TC_USE_CLAUSE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: SNN: selected_name of use_clause containing only a library name - in 'use work;' the selected_name contains only the library_name without package_name/item_name, verifying use_clause allows only the selected_name form
-- Expected Result: Triggers syntax error: use clause allows only selected name
-- Dependencies: None
-- =============================================================
use work;
entity uc2_ent is end entity;
