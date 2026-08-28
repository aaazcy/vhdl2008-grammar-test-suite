-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Negative
-- Test Focus: file_logical_name: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity file_logical_na_e2 is end entity;
architecture bh of file_logical_na_e2 is
  -- ERROR: invalid syntax in file_logical_name
  signal s : bit;
begin
  s <= '1'
end architecture bh;