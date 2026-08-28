-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Positive
-- Test Focus: real literal abstract_literal: real type constants such as 1.5, 0.001, 3.14159 used in floating-point DSP coefficient computation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity num_lit_real is
  port (
    sample_in  : in  real;
    gain       : out real
  );
end entity num_lit_real;

architecture dsp_gain of num_lit_real is
  constant C_COEFF_A : real := 1.5;      -- real abstract_literal
  constant C_COEFF_B : real := 0.001;    -- real abstract_literal with leading zero
  constant C_PI      : real := 3.14159;  -- real abstract_literal
  constant C_SCALE   : real := 2.0E3;    -- real with exponent
begin
  gain <= sample_in * C_COEFF_A + C_COEFF_B * C_PI * C_SCALE;
end architecture dsp_gain;
