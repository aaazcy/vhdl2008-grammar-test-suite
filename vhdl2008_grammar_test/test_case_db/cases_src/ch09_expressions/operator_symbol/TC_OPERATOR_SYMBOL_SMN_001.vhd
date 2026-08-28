-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Negative
-- Rule Description: A unary operator symbol (such as "not") can only be defined with one parameter when overloaded; a binary operator symbol (such as "+") must have exactly two parameters when overloaded
-- Error Category: operator_arity_mismatch
-- Test Focus: SMN — the unary operator "not" is wrongly defined as binary (two parameters x and y), violating the parameter count constraint of the predefined unary operator
-- Expected Result: Triggers semantic error: unary operator "not" overloaded with wrong number of parameters
-- Dependencies: None
-- =============================================================
entity op_sym_smn_001 is
  port (
    a : in  integer;
    b : in  integer;
    r : out integer
  );
end entity op_sym_smn_001;

architecture bad_arity of op_sym_smn_001 is
  -- ERROR: "not" is a predefined unary operator, cannot be overloaded as binary (2 params)
  function "not"(x, y : integer) return integer is
  begin
    return 255 - x - y;
  end function "not";
begin
  r <= a + b;
end architecture bad_arity;
