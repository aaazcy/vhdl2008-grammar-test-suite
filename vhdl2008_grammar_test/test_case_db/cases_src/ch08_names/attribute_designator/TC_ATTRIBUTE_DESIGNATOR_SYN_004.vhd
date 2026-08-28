-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Positive
-- Test Focus: Multiple attribute designators applied to different entity classes — three different attribute_designators (chip_area, power_budget, timing_grade) are applied through attribute specifications to three different entity_classes: entity, signal, and architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_class_varied is
  port(clk : in bit; sig_level : in integer; result : out integer);
  attribute chip_area : real;
  attribute power_budget : real;
  attribute chip_area of attr_class_varied : entity is 1200.5;
  attribute power_budget of sig_level : signal is 45.0;
end entity;

architecture synth_vhdl of attr_class_varied is
  attribute timing_grade : string;
  attribute timing_grade of synth_vhdl : architecture is "FAST";
  signal level_buf : integer := 0;
begin
  level_buf <= sig_level;
  result <= level_buf;
end architecture synth_vhdl;
