-- =============================================================
-- Case ID: TC_EXPONENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Negative
-- Test Focus: Negative number after E+ — only integer is allowed after E+, no additional sign; the minus sign is legal only in E-
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity exp_snn_004 is
  port (
    val_out : out real
  );
end entity exp_snn_004;

architecture rtl of exp_snn_004 is
  constant C_BAD : real := 1.0E+-3;
begin
  val_out <= C_BAD;
end architecture rtl;
