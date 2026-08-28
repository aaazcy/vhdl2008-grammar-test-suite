-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Positive
-- Test Focus: SEMANTIC: file of integer with both read and write operations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- SEMANTIC: file of integer with both read and write operations
entity ftd_sem_read_write is port(dout:out integer); end entity;
architecture rtl of ftd_sem_read_write is
  type t_intfile is file of integer;
  file f : t_intfile open WRITE_MODE is "rw.dat";
  signal s:integer:=0;
begin process begin write(f,10); s<=s+1; dout<=s; wait; end process; end architecture;