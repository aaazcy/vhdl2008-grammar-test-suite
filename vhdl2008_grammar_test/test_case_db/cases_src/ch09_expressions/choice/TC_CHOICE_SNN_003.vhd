-- =============================================================
-- Case ID: TC_CHOICE_SNN_003
-- Rule Type: Syntax
-- BNF Production: choice
-- IEEE Section: 9.3.3.1
-- BNF Text: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Test Focus: choice with missing 'when' keyword context - malformed selected assignment
-- Case Type: Negative
-- Expected Result: Triggers syntax error (missing 'when' before choice)
-- Dependencies: None
-- =============================================================
entity tc_choice_snn_003 is
  port (
    sel    : in  integer range 0 to 3;
    result : out integer
  );
end entity tc_choice_snn_003;

architecture error of tc_choice_snn_003 is
begin
  with sel select
    result <= 0,  -- ERROR: missing 'when' keyword - invalid syntax for selected assignment
             1 when 1,
             2 when others;
end architecture error;
