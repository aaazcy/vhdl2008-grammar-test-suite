-- =============================================================
-- Case ID: TC_INTERFACE_VARIABLE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_variable_declaration ::= [ variable ] identifier_list : [ mode ] subtype_indication [ := static_expression ]
-- Case Type: Negative
-- Test Focus: interface_variable_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_varia_e2 is end entity;
architecture bh of interface_varia_e2 is
  -- ERROR: invalid syntax in interface_variable_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;