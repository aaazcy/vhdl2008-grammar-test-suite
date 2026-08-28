-- =============================================================
-- Case ID: TC_SIGN_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Negative
-- Test Focus: SNN: missing term after sign — in the expression - ; there is no term after the unary minus, the term is missing in the [sign] term structure of simple_expression
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity sign_missing_term is
  port (
    y_o : out integer
  );
end entity sign_missing_term;

architecture vhdl2008 of sign_missing_term is
begin
  y_o <= - ;
end architecture vhdl2008;
