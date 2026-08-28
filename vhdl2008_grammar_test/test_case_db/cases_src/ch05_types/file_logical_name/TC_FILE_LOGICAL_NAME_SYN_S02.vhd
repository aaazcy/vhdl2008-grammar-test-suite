-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_S02
-- Rule Type: Syntax
-- BNF Production: FILE_LOGICAL_NAME ::= string_expression
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive (Production-Specific)
-- Test Focus: String returned from function call — the file_logical_name is the
--   result of a user-defined function that constructs and returns a string
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_log_name_s_s02 is
  port(
    fnc_ok : out integer
  );
end entity;

architecture rtl of file_log_name_s_s02 is
  type t_intfile is file of integer;
  file fh : t_intfile;
  signal s_ok : integer := 0;

  function make_fname(base : string; ext : string) return string is
  begin
    return base & "." & ext;
  end function;

begin
  process
    variable v : integer;
  begin
    file_open(fh, make_fname("testvec", "dat"), READ_MODE);
    if not endfile(fh) then
      read(fh, v);
    end if;
    file_close(fh);
    s_ok <= 1;
    wait;
  end process;
  fnc_ok <= s_ok;
end architecture;
