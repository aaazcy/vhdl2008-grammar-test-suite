-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit name in a physical type definition
-- Case Type: Positive
-- Test Focus: Single primary unit with two secondary units forming a 3-level physical type chain — the primary unit is the reference base for all derived units
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_unit_freq_ref is
  port(
    freq_in  : out integer;
    freq_out : out integer
  );
end entity;

architecture frequency_synth of prim_unit_freq_ref is
  type t_frequency is range 0 to 1000000000 units
    Hz;              -- primary_unit
    kHz = 1000 Hz;   -- secondary_unit
    MHz = 1000 kHz;  -- secondary_unit
  end units;
  signal base_freq : t_frequency := 1 Hz;
  signal rf_freq   : t_frequency := 100 MHz;
begin
  freq_in  <= integer(base_freq / Hz);
  freq_out <= integer(rf_freq / Hz);
end architecture;
