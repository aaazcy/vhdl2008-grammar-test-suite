-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: SEMANTIC -- file logical name resolves to actual file at runtime via string literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fln_sem_write is port(dout:out integer); end entity;
architecture rtl of fln_sem_write is
  type t_intfile is file of integer;
  file f : t_intfile open WRITE_MODE is "output.log";
begin
  process begin write(f, 100); dout<=0; wait; end process;
end architecture rtl;
