-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: File declaration with explicit open using literal string as
--   file_logical_name — the file type is of a record subtype with multiple fields
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_log_name_syn5 is
  port(
    rd : out integer
  );
end entity;

architecture rtl of file_log_name_syn5 is
  type t_sensor_data is record
    id    : integer;
    value : integer;
    ts    : time;
  end record;
  type t_sensor_file is file of t_sensor_data;
  file fh : t_sensor_file open READ_MODE is "sensor_rec.bin";
  signal s_rd : integer := 0;
begin
  process
    variable v : t_sensor_data;
  begin
    if not endfile(fh) then
      read(fh, v);
      s_rd <= v.value;
    end if;
    wait;
  end process;
  rd <= s_rd;
end architecture;
