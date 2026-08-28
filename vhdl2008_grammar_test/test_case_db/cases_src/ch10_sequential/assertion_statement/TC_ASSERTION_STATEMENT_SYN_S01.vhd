-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: assertion_statement used inside a function, report contains a function call and string concatenation, severity is failure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_stmt_func_ent is
  port (
    dividend : in  integer;
    divisor  : in  integer;
    quotient : out integer;
    overflow : out boolean
  );
end entity assert_stmt_func_ent;

architecture safe_div of assert_stmt_func_ent is
  function safe_divide(a, b : integer) return integer is
  begin
    div_by_zero: assert b /= 0
      report "Division by zero: dividend=" & integer'image(a)
      severity failure;
    return a / b;
  end function;
begin
  process(dividend, divisor) is
  begin
    quotient <= safe_divide(dividend, divisor);
    overflow <= false;
  end process;
end architecture safe_div;
