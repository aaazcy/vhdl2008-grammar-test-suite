-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: Three when branches: ALU operation selects 4 opcodes, each mapped to a different output
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_three is
  port (
    op   : in  integer range 0 to 3;
    a, b : in  integer;
    y    : out integer
  );
end entity ent_se_three;

architecture three_branch of ent_se_three is
begin
  with op select
    y <= a + b     when 0,
         a - b     when 1,
         a * b     when 2,
         0         when 3;
end architecture three_branch;
