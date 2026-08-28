-- =============================================================
-- Case ID: TC_INTERFACE_VARIABLE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_variable_declaration ::= [ variable ] identifier_list : [ mode ] subtype_indication [ := static_expression ]
-- Case Type: Negative
-- Test Focus: interface_variable_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_varia_e3 is end entity;
architecture bh of interface_varia_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;