-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Positive
-- Test Focus: Positive: file of a record type for structured data storage
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: file of a record type for structured data storage
-- =============================================================
entity ftd_syn_record_file is port(dout:out integer); end entity;
architecture rtl of ftd_syn_record_file is
  type t_entry is record id:integer; val:integer; end record;
  type t_entryfile is file of t_entry;
  file f : t_entryfile open WRITE_MODE is "entries.dat";
  signal s:integer:=0;
begin process begin write(f,(id=>1,val=>100)); s<=1; dout<=s; wait; end process; end architecture;