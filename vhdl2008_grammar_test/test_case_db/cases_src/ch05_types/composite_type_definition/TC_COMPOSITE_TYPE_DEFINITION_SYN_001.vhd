-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Positive
-- Test Focus: composite_type_definition choosing array_type_definition.
--            A sample buffer implemented as a constrained array
--            of 16-bit words for a simple ADC capture unit.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adc_sample_buffer is
  port (
    clk      : in  bit;
    sample   : in  integer range 0 to 4095;
    index    : in  integer range 0 to 15;
    stored   : out integer range 0 to 4095
  );
end entity adc_sample_buffer;

architecture rtl of adc_sample_buffer is
  -- composite_type_definition: array_type_definition
  type adc_buffer is array (0 to 15) of integer range 0 to 4095;
  signal buf : adc_buffer := (others => 0);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      buf(index) <= sample;
      stored <= buf(index);
    end if;
  end process;
end architecture rtl;
