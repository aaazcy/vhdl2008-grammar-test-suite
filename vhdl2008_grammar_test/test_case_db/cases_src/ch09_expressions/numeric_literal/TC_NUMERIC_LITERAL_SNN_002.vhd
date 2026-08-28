-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SNN_002
-- Rule Type: Syntax
-- BNF Production: numeric_literal
-- IEEE Section: 9.3.3.1
-- BNF Text: numeric_literal ::= abstract_literal | physical_literal
-- Test Focus: invalid numeric literal - malformed based literal with empty exponent
-- Case Type: Negative
-- Expected Result: Triggers syntax error (malformed numeric literal)
-- Dependencies: None
-- =============================================================
entity tc_numeric_literal_snn_002 is
  port (
    val    : out integer
  );
end entity tc_numeric_literal_snn_002;

architecture error of tc_numeric_literal_snn_002 is
begin
  val <= 2#1010E;  -- ERROR: incomplete based literal - missing closing #
end architecture error;
