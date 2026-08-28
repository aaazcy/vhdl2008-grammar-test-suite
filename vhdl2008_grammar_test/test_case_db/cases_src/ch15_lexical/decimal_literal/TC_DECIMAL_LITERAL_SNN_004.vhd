-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Negative
-- Test Focus: Exponent part followed by a decimal point instead of an integer — after E there must be an [optional +] plus an integer, not a fraction
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity dec_lit_snn_004 is
  port (
    val_out : out real
  );
end entity dec_lit_snn_004;

architecture rtl of dec_lit_snn_004 is
  constant C_BAD : real := 1.5E2.;
begin
  val_out <= C_BAD;
end architecture rtl;
