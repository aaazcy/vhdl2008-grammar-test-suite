-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Negative
-- Test Focus: SNN: a two-character combination is not a legal operator: string_literal "//" is an invalid two-character combination, and the C-style comment marker is not recognized by VHDL as a legal operator symbol
-- Expected Result: Triggers syntax error at invalid operator symbol "//"
-- Dependencies: None
-- =============================================================
entity op_sym_snn_005 is
  port (
    a : in  integer;
    b : in  integer;
    r : out integer
  );
end entity op_sym_snn_005;

architecture invalid_double of op_sym_snn_005 is
  -- ERROR: "//" is not a valid VHDL operator symbol
  function "//"(x, y : integer) return integer is
  begin
    return x / y;
  end function "//";
begin
  r <= "//"(a, b);
end architecture invalid_double;
