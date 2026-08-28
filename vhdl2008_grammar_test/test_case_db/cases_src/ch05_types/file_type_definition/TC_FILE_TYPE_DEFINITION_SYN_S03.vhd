-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Positive
-- Test Focus: file of enumeration type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_spc3_ent is port(r:out integer); end entity;
architecture bh of file_spc3_ent is
  type t_opcode is (NOP, LOAD, STORE, ADD, SUB, HALT);
  type t_prog_file is file of t_opcode;
  file f_prog : t_prog_file;
begin
  process begin r <= 1; wait; end process;
end architecture bh;
