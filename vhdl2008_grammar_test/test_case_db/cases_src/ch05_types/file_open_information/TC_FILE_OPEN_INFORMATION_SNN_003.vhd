-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Negative
-- Test Focus: file_open_information: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity file_open_infor_e3 is end entity;
architecture bh of file_open_infor_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;