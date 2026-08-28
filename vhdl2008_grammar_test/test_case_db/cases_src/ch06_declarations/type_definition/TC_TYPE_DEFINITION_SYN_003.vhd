-- =============================================================
-- Case ID: TC_TYPE_DEFINITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_definition ::= scalar_type_definition | composite_type_definition | access_type_definition | file_type_definition | protected_type_definition
-- Case Type: Positive
-- Test Focus: Exercises type_definition via scalar_type_definition path: integer and floating type definitions.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity type_defn_syn3 is
  port (
    clk    : in  bit;
    sample : in  integer range 0 to 1023;
    scaled : out integer range 0 to 4095
  );
end entity type_defn_syn3;

architecture rtl of type_defn_syn3 is
  type t_adc_value is range 0 to 1023;
  type t_gain is range 0 to 4;
  signal s_scaled : t_adc_value := 0;
begin
  process(clk)
    constant C_GAIN : t_gain := 4;
  begin
    if clk'event and clk = '1' then
      s_scaled <= t_adc_value(sample * integer(C_GAIN));
      scaled <= integer(s_scaled) * integer(C_GAIN);
    end if;
  end process;
end architecture rtl;
