-- =============================================================
-- Case ID: TC_INTERFACE_TYPE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.5
-- Production: interface_type_declaration ::= interface_incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: interface_type_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_type_e3 is end entity;
architecture bh of interface_type_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;