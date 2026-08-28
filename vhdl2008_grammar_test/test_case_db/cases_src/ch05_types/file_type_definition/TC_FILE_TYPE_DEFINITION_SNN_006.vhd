-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Negative
-- Test Focus: Syntax error -- file type with empty type_mark position
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity ftd_snn_empty_type is end entity;
architecture rtl of ftd_snn_empty_type is
  type t_bad is file of ;  -- ERROR: no type_mark specified
begin end architecture;