-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: FILE_LOGICAL_NAME ::= string_expression
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive (Production-Specific)
-- Test Focus: Literal string with APPEND_MODE — file opened for append uses
--   the simple literal string expression as file_logical_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_log_name_s_s01 is
  port(
    app_ok : out integer
  );
end entity;

architecture rtl of file_log_name_s_s01 is
  type t_intfile is file of integer;
  file fa : t_intfile;
  signal s_app_ok : integer := 0;
begin
  process
  begin
    file_open(fa, "accum.log", APPEND_MODE);
    write(fa, 999);
    file_close(fa);
    s_app_ok <= 1;
    wait;
  end process;
  app_ok <= s_app_ok;
end architecture;
