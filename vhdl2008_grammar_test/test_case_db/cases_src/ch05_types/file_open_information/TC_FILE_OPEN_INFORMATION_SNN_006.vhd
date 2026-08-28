-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Negative
-- Test Focus: Syntax error -- file declaration missing type_mark in file type definition
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity foi_snn_no_type is end entity;
architecture rtl of foi_snn_no_type is
  type t_bad is file of;  -- ERROR: missing type_mark after 'of'
begin end architecture;