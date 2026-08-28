-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: Underscore-separated compound identifier 'bit_per_sec' as
--            primary unit — anchors a data-rate physical type definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bandwidth_monitor is
  port (
    rate_index : out integer
  );
end entity bandwidth_monitor;

architecture traffic of bandwidth_monitor is
  type t_data_rate is range 0 to 1000000000 units
    bit_per_sec;                              -- primary_unit_declaration: underscore-separated
    kilo_bps = 1000 bit_per_sec;              -- secondary
    mega_bps = 1000 kilo_bps;                 -- secondary
    giga_bps = 1000 mega_bps;                 -- secondary
  end units;
  signal s_link_speed : t_data_rate := 0 bit_per_sec;
begin
  s_link_speed <= 100000000 bit_per_sec after 1 ns;
  rate_index   <= t_data_rate'pos(s_link_speed);
end architecture traffic;
