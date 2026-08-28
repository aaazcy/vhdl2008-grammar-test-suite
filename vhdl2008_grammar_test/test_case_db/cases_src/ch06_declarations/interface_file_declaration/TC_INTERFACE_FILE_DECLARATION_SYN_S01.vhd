-- =============================================================
-- Case ID: TC_INTERFACE_FILE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.3
-- Test Focus: Interface file declaration: file identifier {,identifier} : subtype_indication — file parameter to subprogram
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_file_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_file_declaration_syn_s01 is
  type t_file_int is file of integer;
begin
  r<=42;end architecture bh;
