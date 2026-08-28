-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: String constant as file_logical_name — a named constant holding
--   the filename string is referenced in the FILE_OPEN call
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_log_name_syn3 is
  port(
    flag : out integer
  );
end entity;

architecture rtl of file_log_name_syn3 is
  constant C_FNAME : string := "stimulus.txt";
  type t_intfile is file of integer;
  file fh : t_intfile;
  signal s_flag : integer := 0;
begin
  process
    variable v : integer;
  begin
    file_open(fh, C_FNAME, READ_MODE);
    if not endfile(fh) then
      read(fh, v);
    end if;
    file_close(fh);
    s_flag <= 1;
    wait;
  end process;
  flag <= s_flag;
end architecture;
