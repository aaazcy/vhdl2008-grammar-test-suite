-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Positive
-- Test Focus: element_constraint using array_constraint to constrain
--            the element type of an array subtype. A FIR filter
--            coefficient bank with fixed-point integer coefficients.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fir_coefficient_bank is
  port (
    clk    : in  bit;
    tap    : in  integer range 0 to 15;
    coeff  : out integer range -256 to 255
  );
end entity fir_coefficient_bank;

architecture rtl of fir_coefficient_bank is
  -- element_constraint as array_constraint on element
  subtype coeff_t is integer range -256 to 255;
  type coeff_bank is array (0 to 15) of coeff_t;
  constant bank : coeff_bank := (
    0 => 5, 1 => -3, 2 => 7, 3 => -2, 4=> 4, 5=> 1, 6=>0, 7=>-1,
    8 => 2, 9 => -4, 10 => 3, 11 => -5, 12 => 6, 13 => -1, 14=>0, 15=>2
  );
begin
  coeff <= bank(tap);
end architecture rtl;
