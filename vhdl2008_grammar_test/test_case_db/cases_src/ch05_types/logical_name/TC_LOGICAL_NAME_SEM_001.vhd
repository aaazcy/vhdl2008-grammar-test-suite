-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Positive
-- Test Focus: SEMANTIC: logical_name as a file identifier passed to a procedure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- SEMANTIC: logical_name as a file identifier passed to a procedure
entity logical_name_sem_param is port(dout:out integer); end entity;
architecture rtl of logical_name_sem_param is
  type t_intfile is file of integer;
  procedure log_msg(file f:t_intfile) is begin write(f,42); end procedure;
  file f_log : t_intfile open WRITE_MODE is "log.txt";
begin process begin log_msg(f_log); dout<=0; wait; end process; end architecture;