-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: Two when branches: with sel select y <= a when 0, b when 1 — the minimal multi-branch form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_two is
  port (
    sel : in  bit;
    a   : in  integer;
    b   : in  integer;
    y   : out integer
  );
end entity ent_se_two;

architecture two_branch of ent_se_two is
begin
  with sel select
    y <= a when '0',
         b when '1';
end architecture two_branch;
