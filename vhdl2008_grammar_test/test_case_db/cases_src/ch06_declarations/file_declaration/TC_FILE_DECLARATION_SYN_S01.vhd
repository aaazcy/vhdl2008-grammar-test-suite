-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2
-- Test Focus: File declaration: file identifier {,identifier} : subtype_indication [file_open_information];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_file_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_file_declaration_syn_s01 is
  type t_int_file is file of integer;
  -- file f_data : t_int_file open read_mode is "data.txt";
begin
  r<=42;end architecture bh;
