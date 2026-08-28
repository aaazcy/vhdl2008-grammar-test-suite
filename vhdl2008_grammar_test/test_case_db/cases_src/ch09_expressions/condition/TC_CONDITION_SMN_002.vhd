-- =============================================================
-- Case ID: TC_CONDITION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITION_TYPE_BOOLEAN
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Negative
-- Rule Description: The type of the expression in a condition must be boolean (or convertible via the condition operation ??); the integer type cannot be used directly as a condition
-- Error Category: Type mismatch in condition
-- Test Focus: SMN: the conditional expression is of type integer — in if n then, n is of type integer and cannot be implicitly converted to boolean, so the condition type is illegal
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================

entity cond_integer_expr is
  port (
    n : in  integer;
    y : out integer
  );
end entity cond_integer_expr;

architecture vhdl2008 of cond_integer_expr is
begin
  process(n)
  begin
    if n then
      y <= 1;
    else
      y <= 0;
    end if;
  end process;
end architecture vhdl2008;
