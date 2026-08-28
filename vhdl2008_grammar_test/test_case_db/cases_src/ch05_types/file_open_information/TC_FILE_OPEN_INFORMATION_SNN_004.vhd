-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Negative
-- Test Focus: Syntax error -- invalid file_open_kind_expression
--            using a bare integer instead of a file_open_kind value.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity foi_snn_bad_kind is
end entity foi_snn_bad_kind;
architecture rtl of foi_snn_bad_kind is
  type t_intfile is file of integer;
  file f_bad : t_intfile open 42 is "data.dat";  -- ERROR: 42 not a valid file_open_kind
begin
end architecture rtl;
