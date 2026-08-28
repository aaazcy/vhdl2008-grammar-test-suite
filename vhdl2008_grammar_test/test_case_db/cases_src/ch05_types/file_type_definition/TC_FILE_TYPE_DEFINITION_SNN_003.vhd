-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Negative
-- Test Focus: file_type_definition: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity file_type_defin_e3 is end entity;
architecture bh of file_type_defin_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;