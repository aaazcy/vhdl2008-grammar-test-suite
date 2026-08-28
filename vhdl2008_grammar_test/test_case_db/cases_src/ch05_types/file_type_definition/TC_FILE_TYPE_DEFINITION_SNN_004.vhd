-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Negative
-- Test Focus: ERROR: file of a file type (nested file types illegal)
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: file of a file type (nested file types illegal)
entity ftd_snn_nested_file is end entity;
architecture rtl of ftd_snn_nested_file is
  type t_inner is file of integer;
  type t_bad is file of t_inner;  -- ERROR: file of file type not allowed
begin end architecture;