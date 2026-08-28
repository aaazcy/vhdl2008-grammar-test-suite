-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Positive
-- Test Focus: Real/decimal abstract_literal with unit_name — exercises fractional physical literals like 3.3 ns, 1.5 us with floating-point prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_lit_real_scaled is
  port(
    delay_setting : in  real;
    dly_out       : out time
  );
end entity;

architecture fractional_timing of phys_lit_real_scaled is
  constant C_MIN_DELAY : time := 1.5 ns;
  constant C_MAX_DELAY : time := 100.0 ns;
  constant C_STEP       : time := 2.5 ns;
  signal current_dly    : time := 10.0 ns;
begin
  current_dly <= C_MIN_DELAY when delay_setting < 0.5
                 else C_MAX_DELAY when delay_setting > 50.0
                 else C_STEP;
  dly_out <= current_dly;
end architecture;
