-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: file_declaration ::= file identifier_list : subtype_indication [ file_open_information ] ;
-- Case Type: Negative
-- Test Focus: file_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity file_declaratio_e2 is end entity;
architecture bh of file_declaratio_e2 is
  -- ERROR: invalid syntax in file_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;