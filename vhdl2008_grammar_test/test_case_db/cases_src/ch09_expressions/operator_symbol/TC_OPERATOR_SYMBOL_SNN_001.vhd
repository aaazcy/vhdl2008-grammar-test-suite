-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Negative
-- Test Focus: SNN: the operator in the function declaration is not enclosed in a double-quoted string_literal — the bare '+' in function + (...) is not a legal operator_symbol, an operator symbol must be written as a string literal (such as "+")
-- Expected Result: Triggers syntax error: an identifier is expected instead of '+'
-- Dependencies: None
-- =============================================================
entity op_sym_bare_plus is
  port (
    a : in  integer;
    y : out integer
  );
end entity op_sym_bare_plus;

architecture vhdl2008 of op_sym_bare_plus is
  function + (x, y2 : integer) return integer is
  begin
    return x + y2;
  end function;
begin
  y <= a;
end architecture vhdl2008;
