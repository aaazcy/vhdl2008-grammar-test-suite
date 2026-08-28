-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Negative
-- Test Focus: Exponent E followed by a minus sign and then a decimal point — after E - there must be an integer, it cannot start with a decimal point
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity dec_lit_snn_005 is
  port (
    val_out : out real
  );
end entity dec_lit_snn_005;

architecture rtl of dec_lit_snn_005 is
  constant C_BAD : real := 3.0E-.5;
begin
  val_out <= C_BAD;
end architecture rtl;
