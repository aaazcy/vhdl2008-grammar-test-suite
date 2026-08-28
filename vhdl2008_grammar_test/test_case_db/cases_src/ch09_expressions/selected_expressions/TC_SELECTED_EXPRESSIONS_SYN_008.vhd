-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: Comprehensive showcase: complex expression branches and pipe separator — each when branch holds a complex arithmetic expression, choices use pipe to separate multiple values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_complex is
  port (
    cmd  : in  integer range 0 to 5;
    x, y : in  integer;
    z    : out integer
  );
end entity ent_se_complex;

architecture complex_sel of ent_se_complex is
begin
  with cmd select
    z <= x + y        when 0,
         x - y        when 1 | 2,
         x * y        when 3,
         y * 2 + x    when 4,
         0            when others;
end architecture complex_sel;
