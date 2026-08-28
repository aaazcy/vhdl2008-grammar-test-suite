-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Negative
-- Test Focus: SNN — a non-operator string used as operator_symbol: the string_literal "foobar" is not a legal predefined VHDL operator character sequence and cannot be used as an operator name
-- Expected Result: Triggers syntax error at invalid operator string "foobar"
-- Dependencies: None
-- =============================================================
entity op_sym_snn_004 is
  port (
    a : in  integer;
    b : in  integer;
    r : out integer
  );
end entity op_sym_snn_004;

architecture invalid_string of op_sym_snn_004 is
  -- ERROR: "foobar" is not a valid VHDL operator symbol
  function "foobar"(x, y : integer) return integer is
  begin
    return x + y;
  end function "foobar";
begin
  r <= "foobar"(a, b);
end architecture invalid_string;
