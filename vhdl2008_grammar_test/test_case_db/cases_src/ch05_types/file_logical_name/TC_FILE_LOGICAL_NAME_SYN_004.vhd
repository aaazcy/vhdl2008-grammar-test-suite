-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: Multiple concatenation chain — three segments joined to form
--   a qualified path: directory + separator + filename
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_log_name_syn4 is
  port(
    ok : out integer
  );
end entity;

architecture rtl of file_log_name_syn4 is
  constant C_DIR  : string := "testdata";
  constant C_SEP  : string := "/";
  constant C_FILE : string := "input.bin";
  type t_intfile is file of integer;
  file fh : t_intfile;
  signal s_ok : integer := 0;
begin
  process
    variable v : integer;
  begin
    file_open(fh, C_DIR & C_SEP & C_FILE, READ_MODE);
    if not endfile(fh) then
      read(fh, v);
    end if;
    file_close(fh);
    s_ok <= 1;
    wait;
  end process;
  ok <= s_ok;
end architecture;
