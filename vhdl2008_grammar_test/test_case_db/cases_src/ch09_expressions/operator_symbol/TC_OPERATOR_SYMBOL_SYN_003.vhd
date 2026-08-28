-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SYN_003
-- Rule Type: Syntax
-- BNF Production: operator_symbol
-- IEEE Section: 9.2.1
-- BNF Text: operator_symbol ::= string_literal
-- Test Focus: operator_symbol used in alias declaration to create a named alias for an operator
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_operator_symbol_syn_003 is
  port (
    a, b   : in  integer;
    result : out integer
  );
end entity tc_operator_symbol_syn_003;

architecture alias_of_op of tc_operator_symbol_syn_003 is
  alias op_add is "+"[integer, integer return integer];
begin
  result <= op_add(a, b);
end architecture alias_of_op;
