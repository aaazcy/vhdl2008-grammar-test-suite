-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Negative
-- Test Focus: Syntax error -- file_logical_name as character literal (not string_expression)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity fln_snn_char is end entity;
architecture rtl of fln_snn_char is
  type t_intfile is file of integer;
  file f : t_intfile open READ_MODE is 'X';  -- ERROR: character not string_expression
begin
end architecture rtl;
