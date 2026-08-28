-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Positive
-- Test Focus: SEMANTIC -- file declared in a process with APPEND_MODE
--            where data written persists across simulation. Tests that
--            the semantic association between file declaration, open
--            mode, and logical name works correctly for write-append.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity foi_sem_append_write is
  port (
    dout : out integer
  );
end entity foi_sem_append_write;
architecture rtl of foi_sem_append_write is
  type t_intfile is file of integer;
  file f_log : t_intfile open APPEND_MODE is "results.dat";
begin
  process
  begin
    write(f_log, 42);
    write(f_log, 100);
    dout <= 0;
    wait;
  end process;
end architecture rtl;
