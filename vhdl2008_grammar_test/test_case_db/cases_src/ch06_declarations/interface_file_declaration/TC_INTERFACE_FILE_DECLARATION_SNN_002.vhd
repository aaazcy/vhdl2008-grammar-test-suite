-- =============================================================
-- Case ID: TC_INTERFACE_FILE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_file_declaration ::= file identifier_list : subtype_indication
-- Case Type: Negative
-- Test Focus: interface_file_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_file_e2 is end entity;
architecture bh of interface_file_e2 is
  -- ERROR: invalid syntax in interface_file_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;