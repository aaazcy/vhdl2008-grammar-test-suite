-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Positive
-- Test Focus: Minimal form: use string_literal "+" as the function name of a binary operator, overloading addition for the integer type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity op_sym_minimal is
  port (
    a : in  integer;
    b : in  integer;
    r : out integer
  );
end entity op_sym_minimal;

architecture overload of op_sym_minimal is
  function "+"(x, y : integer) return integer is
  begin
    return x + y;
  end function "+";
begin
  r <= "+"(a, b);
end architecture overload;
