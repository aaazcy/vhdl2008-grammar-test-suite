-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Negative
-- Test Focus: ERROR: file type used as a signal type (files are not synthesizable)
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: file type used as a signal type (files are not synthesizable)
entity ftd_smn_file_as_signal is port(dout:out integer); end entity;
architecture rtl of ftd_smn_file_as_signal is
  type t_intfile is file of integer;
  signal s_bad : t_intfile;  -- ERROR: file type cannot be signal type
begin dout<=0; end architecture;