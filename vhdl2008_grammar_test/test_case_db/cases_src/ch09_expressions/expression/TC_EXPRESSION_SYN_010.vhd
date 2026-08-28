-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: expression in a function return: an xnor logical expression as the return value; the function compares the equality of two vectors
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_func_ent is
  port(vec_a, vec_b : in bit; equal : out bit);
end entity;
architecture rtl of expr_func_ent is
  function are_equal(p, q : bit) return bit is
  begin
    return p xnor q;
  end function;
begin
  equal <= are_equal(vec_a, vec_b);
end architecture rtl;
