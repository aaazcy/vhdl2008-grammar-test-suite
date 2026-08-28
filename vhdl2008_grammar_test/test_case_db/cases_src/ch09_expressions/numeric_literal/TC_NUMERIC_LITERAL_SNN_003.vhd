-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SNN_003
-- Rule Type: Syntax
-- BNF Production: numeric_literal
-- IEEE Section: 9.3.3.1
-- BNF Text: numeric_literal ::= abstract_literal | physical_literal
-- Test Focus: numeric literal type mismatch - physical literal (time) assigned to integer
-- Case Type: Negative
-- Expected Result: Triggers semantic error (cannot assign time type to integer)
-- Dependencies: None
-- =============================================================
entity tc_numeric_literal_snn_003 is
  port (
    val    : out integer
  );
end entity tc_numeric_literal_snn_003;

architecture error of tc_numeric_literal_snn_003 is
begin
  val <= 10 ns;  -- ERROR: physical literal of type 'time' cannot be assigned to 'integer' port
end architecture error;
