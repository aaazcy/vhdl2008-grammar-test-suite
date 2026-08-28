-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Positive
-- Test Focus: File open information with WRITE_MODE and a file
--            logical name specified as a string expression variable.
--            Tests that the file_logical_name can be a runtime string.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity foi_write_mode_var is
  port (
    dout : out integer
  );
end entity foi_write_mode_var;
architecture rtl of foi_write_mode_var is
  type t_logfile is file of integer;
  constant C_FNAME : string := "output.dat";
  file f_out : t_logfile open WRITE_MODE is C_FNAME;
begin
  process
  begin
    write(f_out, 42);
    dout <= 0;
    wait;
  end process;
end architecture rtl;
