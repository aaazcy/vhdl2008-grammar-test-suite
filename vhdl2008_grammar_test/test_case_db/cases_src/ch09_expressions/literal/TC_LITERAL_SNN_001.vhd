-- =============================================================
-- Case ID: TC_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Negative
-- Test Focus: SNN — null literal used in an arithmetic expression: null is a legal literal, but it cannot be used as an addition operand, null + 1 is illegal
-- Expected Result: Triggers syntax error: null literal cannot be an operand of arithmetic operator "+"
-- Dependencies: None
-- =============================================================
entity lit_snn_001 is
  port (
    x : out integer
  );
end entity lit_snn_001;

architecture null_in_expr of lit_snn_001 is
  signal s_bad : integer := 0;
begin
  -- ERROR: null literal cannot be used as an operand in arithmetic expression
  s_bad <= null + 1;
  x <= s_bad;
end architecture null_in_expr;
