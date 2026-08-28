-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: file_open() in WRITE_MODE with string literal filename — tests
--   file_logical_name in write context with the same string literal form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_log_name_syn6 is
  port(
    wr_ok : out integer
  );
end entity;

architecture rtl of file_log_name_syn6 is
  type t_intfile is file of integer;
  file fw : t_intfile;
  signal s_wr_ok : integer := 0;
begin
  process
  begin
    file_open(fw, "output.txt", WRITE_MODE);
    write(fw, 100);
    write(fw, 200);
    write(fw, 300);
    file_close(fw);
    s_wr_ok <= 1;
    wait;
  end process;
  wr_ok <= s_wr_ok;
end architecture;
