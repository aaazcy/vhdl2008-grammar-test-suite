-- =============================================================
-- Case ID: TC_INTERFACE_OBJECT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_object_declaration ::= interface_constant_declaration interface_signal_declaration | interface_variable_declaration | interface_file_declaration
-- Case Type: Negative
-- Test Focus: interface_object_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_objec_e2 is end entity;
architecture bh of interface_objec_e2 is
  -- ERROR: invalid syntax in interface_object_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;