-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: file_declaration ::= file identifier_list : subtype_indication [ file_open_information ] ;
-- Case Type: Negative
-- Test Focus: file_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity file_declaratio_e3 is end entity;
architecture bh of file_declaratio_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;