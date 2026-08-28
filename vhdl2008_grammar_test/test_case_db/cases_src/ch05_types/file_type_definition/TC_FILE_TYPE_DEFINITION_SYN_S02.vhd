-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Positive
-- Test Focus: file of custom record type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_spc2_ent is port(r:out integer); end entity;
architecture bh of file_spc2_ent is
  type t_log_entry is record
    timestamp : time;
    level     : integer;
    msg       : string(1 to 80);
  end record;
  type t_log_file is file of t_log_entry;
  file f_log : t_log_file;
begin
  process begin r <= 1; wait; end process;
end architecture bh;
