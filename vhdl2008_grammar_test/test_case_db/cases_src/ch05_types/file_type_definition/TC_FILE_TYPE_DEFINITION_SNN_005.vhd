-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Negative
-- Test Focus: ERROR: missing 'file' keyword
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: missing 'file' keyword
entity ftd_snn_missing_file_kw is end entity;
architecture rtl of ftd_snn_missing_file_kw is
  type t_bad is of integer;  -- ERROR: missing 'file' keyword
begin end architecture;