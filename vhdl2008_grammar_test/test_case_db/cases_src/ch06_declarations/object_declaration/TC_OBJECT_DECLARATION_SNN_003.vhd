-- =============================================================
-- Case ID: TC_OBJECT_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2
-- Production: object_declaration ::= constant_declaration signal_declaration | variable_declaration | file_declaration
-- Case Type: Negative
-- Test Focus: object_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity object_declarat_e3 is end entity;
architecture bh of object_declarat_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;