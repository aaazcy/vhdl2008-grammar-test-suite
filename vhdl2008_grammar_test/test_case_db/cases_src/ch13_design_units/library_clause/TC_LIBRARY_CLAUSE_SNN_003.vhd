-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Test Focus: library_clause: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity library_clause_e3 is end entity;
architecture bh of library_clause_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;