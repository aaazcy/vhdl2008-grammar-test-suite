-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Positive
-- Test Focus: Positive: file of integer used with file operations (read/write/endfile)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: file of integer used with file operations (read/write/endfile)
-- =============================================================
entity ftd_syn_file_ops is port(dout:out integer); end entity;
architecture rtl of ftd_syn_file_ops is
  type t_intfile is file of integer;
  file f : t_intfile open WRITE_MODE is "test.dat";
begin process begin write(f, 42); dout<=0; wait; end process; end architecture;