-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Positive
-- Test Focus: Positive: file declared in a subprogram for local file access
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: file declared in a subprogram for local file access
-- =============================================================
entity ftd_syn_subprog_file is port(dout:out integer); end entity;
architecture rtl of ftd_syn_subprog_file is
  type t_intfile is file of integer;
  procedure save_val(v:integer) is
    file f : t_intfile open APPEND_MODE is "log.dat";
  begin write(f, v); end procedure;
begin process begin save_val(42); dout<=0; wait; end process; end architecture;