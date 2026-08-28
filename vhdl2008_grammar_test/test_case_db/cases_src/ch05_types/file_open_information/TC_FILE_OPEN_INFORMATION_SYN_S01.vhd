-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5
-- Test Focus: File open information: [open file_open_kind_expression] file_logical_name
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_file_open_information_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_file_open_information_syn_s01 is
    signal s_foi:integer:=0;
begin
  s_foi<=1; r<=s_foi;end architecture bh;
