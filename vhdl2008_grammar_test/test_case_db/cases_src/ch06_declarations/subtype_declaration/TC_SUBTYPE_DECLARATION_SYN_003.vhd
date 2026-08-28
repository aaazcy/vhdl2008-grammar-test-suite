-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: Exercises subtype_declaration with range constraint creating a valid voltage range for an ADC interface.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subtype_decl_syn3 is
  port (
    raw_adc    : in  integer range 0 to 4095;
    volt_mv    : out integer range 0 to 3300
  );
end entity subtype_decl_syn3;

architecture rtl of subtype_decl_syn3 is
  subtype t_adc_raw is integer range 0 to 4095;
  subtype t_voltage_mv is integer range 0 to 3300;
  constant C_VREF_MV : t_voltage_mv := 3300;
  signal s_raw : t_adc_raw := 0;
begin
  s_raw <= raw_adc;
  volt_mv <= (s_raw * C_VREF_MV) / 4095;
end architecture rtl;
