-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SNN_002
-- Rule Type: Syntax
-- BNF Production: operator_symbol
-- IEEE Section: 9.2.1
-- BNF Text: operator_symbol ::= string_literal
-- Test Focus: invalid operator_symbol - using a string that is not a valid VHDL operator
-- Case Type: Negative
-- Expected Result: Triggers syntax error (invalid operator symbol string)
-- Dependencies: None
-- =============================================================
entity tc_operator_symbol_snn_002 is
  port (
    a     : in  integer;
    b     : in  integer;
    r     : out integer
  );
end entity tc_operator_symbol_snn_002;

architecture error of tc_operator_symbol_snn_002 is
  -- ERROR: "##" is not a valid VHDL operator symbol
  function "##"(x, y : integer) return integer is
  begin
    return x + y;
  end function "##";
begin
  r <= "##"(a, b);
end architecture error;
