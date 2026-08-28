-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Negative
-- Test Focus: SNN: the exponent part of abstract_literal is missing digits — in 1e+ there are no digits after the exponent sign +, the exponent of an abstract literal must consist of an exponent sign plus some digits
-- Expected Result: Triggers syntax error: digit expected after exponent
-- Dependencies: None
-- =============================================================
entity num_lit_bad_exponent is
  port (
    x : out integer
  );
end entity num_lit_bad_exponent;

architecture vhdl2008 of num_lit_bad_exponent is
  constant C_BAD : integer := 1e+;
begin
  x <= 0;
end architecture vhdl2008;
