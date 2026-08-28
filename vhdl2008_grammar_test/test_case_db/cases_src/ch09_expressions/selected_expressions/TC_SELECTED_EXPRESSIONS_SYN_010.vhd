-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected expression with pipe-separated choices and complex expressions: when 1, 2, 3 (pipe-separated) separates multiple choices, expression branches are arithmetic operations a+b, a-b, a*b, 0
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity se_pipe_complex is
  port (
    op   : in  integer range 0 to 3;
    a, b : in  integer;
    y    : out integer
  );
end entity se_pipe_complex;

architecture pipe_expr of se_pipe_complex is
begin
  with op select
    y <= a + b      when 0,
         a - b      when 1 | 2,
         a * b      when 3,
         0          when others;
end architecture pipe_expr;
