-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: Literal string as file_logical_name in FILE_OPEN call — simple
--   "data.txt" passed directly to file_open()
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_log_name_syn1 is
  port(
    status : out integer
  );
end entity;

architecture rtl of file_log_name_syn1 is
  type t_intfile is file of integer;
  file fh : t_intfile;
  signal s_done : integer := 0;
begin
  process
    variable v : integer;
  begin
    file_open(fh, "data.txt", READ_MODE);
    if not endfile(fh) then
      read(fh, v);
    end if;
    file_close(fh);
    s_done <= 1;
    wait;
  end process;
  status <= s_done;
end architecture;
