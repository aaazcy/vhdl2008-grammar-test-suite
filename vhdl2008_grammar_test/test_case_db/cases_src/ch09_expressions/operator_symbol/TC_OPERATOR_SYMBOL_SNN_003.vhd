-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SNN_003
-- Rule Type: Syntax
-- BNF Production: operator_symbol
-- IEEE Section: 9.2.1
-- BNF Text: operator_symbol ::= string_literal
-- Test Focus: operator_symbol with wrong arity - binary operator defined with 3 parameters
-- Case Type: Negative
-- Expected Result: Triggers semantic error (operator arity mismatch)
-- Dependencies: None
-- =============================================================
entity tc_operator_symbol_snn_003 is
  port (
    a     : in  integer;
    b     : in  integer;
    r     : out integer
  );
end entity tc_operator_symbol_snn_003;

architecture error of tc_operator_symbol_snn_003 is
  -- ERROR: "+" is a binary operator but defined here with 3 parameters
  function "+"(x, y, z : integer) return integer is
  begin
    return x + y + z;
  end function "+";
begin
  r <= "+"(a, b);  -- Cannot call 3-param function with 2 args
end architecture error;
