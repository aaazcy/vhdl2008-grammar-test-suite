-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SYN_002
-- Rule Type: Syntax
-- BNF Production: operator_symbol
-- IEEE Section: 9.2.1
-- BNF Text: operator_symbol ::= string_literal
-- Test Focus: overloaded operator_symbol "*" for a custom vector type multiplication
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_operator_symbol_syn_002 is
  port (
    a, b   : in  integer;
    prod   : out integer
  );
end entity tc_operator_symbol_syn_002;

architecture overloaded_op of tc_operator_symbol_syn_002 is
  function "*"(x, y : integer) return integer is
  begin
    return x * y;
  end function "*";
begin
  prod <= "*"(a, b);
end architecture overloaded_op;
