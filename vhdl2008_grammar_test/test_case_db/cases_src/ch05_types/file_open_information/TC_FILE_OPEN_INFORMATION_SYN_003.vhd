-- =============================================================
-- Case ID: TC_FILE_OPEN_INFORMATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_OPEN_INFORMATION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_open_information ::= [ open file_open_kind_expression ] is file_logical_name
-- Case Type: Positive
-- Test Focus: File open information with explicit READ_MODE open
--            kind expression. Tests the full form with open kind
--            specified as a file_open_kind expression value.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity foi_read_mode is
  port (
    dout : out integer
  );
end entity foi_read_mode;
architecture rtl of foi_read_mode is
  type t_intfile is file of integer;
  file f_data : t_intfile open READ_MODE is "input.dat";
  signal s_val : integer := 0;
begin
  process
    variable v : integer;
  begin
    read(f_data, v);
    s_val <= v;
    dout <= s_val;
    wait;
  end process;
end architecture rtl;
