-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Positive
-- Test Focus: Semantic: element_subtype_definition used for
--            a ROM-based sine wave lookup table. Each table
--            entry is a constrained 12-bit signed sample.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sine_wave_lut is
  port (
    phase    : in  integer range 0 to 63;
    sine_val : out integer range -2048 to 2047
  );
end entity sine_wave_lut;

architecture rtl of sine_wave_lut is
  -- element_subtype_definition for LUT element
  subtype sample_t is integer range -2048 to 2047;
  type sine_lut is array (0 to 63) of sample_t;
  constant sine_table : sine_lut := (
    0 => 0,    1 => 200,  2 => 398,  3 => 593,
    4 => 782,  5 => 964,  6 => 1137, 7 => 1300,
    8 => 1451, 9 => 1589, 10 => 1712, 11 => 1819,
    12 => 1909, 13 => 1980, 14 => 2032, 15 => 2047,
    others => 0
  );
begin
  sine_val <= sine_table(phase);
end architecture rtl;
