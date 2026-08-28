-- =============================================================
-- Case ID: TC_INCOMPLETE_TYPE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INCOMPLETE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: incomplete_type_declaration ::= type identifier ;
-- Case Type: Negative
-- Test Focus: incomplete_type_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity incomplete_type_e3 is end entity;
architecture bh of incomplete_type_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;