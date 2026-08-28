-- =============================================================
-- Case ID: TC_EXPONENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Negative
-- Test Focus: Double minus sign E--integer — exponent allows only one minus sign, after E- comes integer, not a second minus sign
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity exp_snn_005 is
  port (
    val_out : out real
  );
end entity exp_snn_005;

architecture rtl of exp_snn_005 is
  constant C_BAD : real := 1.0E--3;
begin
  val_out <= C_BAD;
end architecture rtl;
