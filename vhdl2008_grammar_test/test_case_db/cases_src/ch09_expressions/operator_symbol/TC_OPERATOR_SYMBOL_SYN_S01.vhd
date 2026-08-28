-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: operator_symbol
-- IEEE Section: 9.2.1
-- BNF Text: operator_symbol ::= string_literal
-- Test Focus: operator_symbol as function name using "+" string_literal to overload addition for a custom type
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_operator_symbol_syn_s01 is
  port (
    a, b   : in  integer;
    sum    : out integer
  );
end entity tc_operator_symbol_syn_s01;

architecture func_overload of tc_operator_symbol_syn_s01 is
  function "+"(x, y : integer) return integer is
  begin
    return x + y;
  end function "+";
begin
  sum <= "+"(a, b);
end architecture func_overload;
