-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Negative
-- Test Focus: Missing integer part — a decimal_literal with only a decimal point and a fractional part (such as .5) is illegal, an integer part is required
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity dec_lit_snn_001 is
  port (
    val_out : out real
  );
end entity dec_lit_snn_001;

architecture rtl of dec_lit_snn_001 is
  constant C_BAD : real := .5;
begin
  val_out <= C_BAD;
end architecture rtl;
