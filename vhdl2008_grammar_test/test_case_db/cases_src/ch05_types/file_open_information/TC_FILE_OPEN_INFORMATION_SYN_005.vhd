-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Positive
-- Test Focus: File open information with APPEND_MODE open kind for
--            appending to an existing file. Tests the APPEND_MODE
--            expression as a valid file_open_kind.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity foi_append_mode is
  port (
    dout : out integer
  );
end entity foi_append_mode;
architecture rtl of foi_append_mode is
  type t_logfile is file of integer;
  file f_app : t_logfile open APPEND_MODE is "log.dat";
begin
  process
  begin
    write(f_app, 100);
    dout <= 0;
    wait;
  end process;
end architecture rtl;
