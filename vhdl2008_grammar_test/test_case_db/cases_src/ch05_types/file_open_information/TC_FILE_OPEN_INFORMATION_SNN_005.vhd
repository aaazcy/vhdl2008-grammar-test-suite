-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Negative
-- Test Focus: Syntax error -- file logical name as an integer
--            instead of a string_expression. The file_logical_name
--            must be a string expression, not an integer literal.
-- Expected Result: Triggers type error
-- Dependencies: None
-- =============================================================
entity foi_snn_int_name is
end entity foi_snn_int_name;
architecture rtl of foi_snn_int_name is
  type t_intfile is file of integer;
  file f_bad : t_intfile is 12345;  -- ERROR: integer not a valid file name string
begin
end architecture rtl;
