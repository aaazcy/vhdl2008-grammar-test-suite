-- =============================================================
-- Case ID: TC_EXPONENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Negative
-- Test Focus: Letter instead of integer after E — after E there must be [+]integer or -integer, a non-digit character cannot directly follow
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity exp_snn_001 is
  port (
    val_out : out real
  );
end entity exp_snn_001;

architecture rtl of exp_snn_001 is
  constant C_BAD : real := 1.0EX;
begin
  val_out <= C_BAD;
end architecture rtl;
