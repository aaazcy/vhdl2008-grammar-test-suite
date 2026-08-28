-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Negative
-- Test Focus: SMN: decimal_literal missing the integer part — .5 starts with a decimal point without any integer digits, the integer part of decimal_literal is required
-- Expected Result: Triggers analysis error: unexpected token '.' in a primary
-- Dependencies: None
-- =============================================================
entity dec_lit_missing_int is
  port (
    t_out : out real
  );
end entity dec_lit_missing_int;

architecture vhdl2008 of dec_lit_missing_int is
  constant C_BAD : real := .5;
begin
  t_out <= 0.0;
end architecture vhdl2008;
