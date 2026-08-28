-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Semantic: circular buffer implemented with a
--            constrained array of time-stamped entries for
--            a data logger.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity data_logger_buffer is
  port (
    clk       : in  bit;
    sample    : in  integer range -2048 to 2047;
    timestamp : in  integer range 0 to 86400;
    idx       : in  integer range 0 to 63;
    logged    : out integer range -2048 to 2047
  );
end entity data_logger_buffer;

architecture rtl of data_logger_buffer is
  type log_entry is record
    value     : integer range -2048 to 2047;
    time_sec  : integer range 0 to 86400;
  end record;
  type log_buffer is array (0 to 63) of log_entry;
  signal log : log_buffer := (others => (value => 0, time_sec => 0));
  signal write_ptr : integer range 0 to 63 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      log(write_ptr).value    <= sample;
      log(write_ptr).time_sec <= timestamp;
      write_ptr <= (write_ptr + 1) mod 64;
      logged <= log(idx).value;
    end if;
  end process;
end architecture rtl;
