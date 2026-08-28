-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Positive
-- Test Focus: With expression in function: `return a + b;` returns the computed result of the expression, verifying that return in a function carries the return expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity return_with_expr_ent is
  port (
    a : in  integer range 0 to 255;
    b : in  integer range 0 to 255;
    c : out integer range 0 to 510
  );
end entity return_with_expr_ent;

architecture adder of return_with_expr_ent is
  function add_saturate(x, y : integer) return integer is
  begin
    if x + y > 510 then
      return 510;
    end if;
    return x + y;
  end function;
begin
  process(a, b) is
  begin
    c <= add_saturate(a, b);
  end process;
end architecture adder;
