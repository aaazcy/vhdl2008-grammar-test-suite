-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Negative
-- Test Focus: file_type_definition: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity file_type_defin_e2 is end entity;
architecture bh of file_type_defin_e2 is
  -- ERROR: invalid syntax in file_type_definition
  signal s : bit;
begin
  s <= '1'
end architecture bh;