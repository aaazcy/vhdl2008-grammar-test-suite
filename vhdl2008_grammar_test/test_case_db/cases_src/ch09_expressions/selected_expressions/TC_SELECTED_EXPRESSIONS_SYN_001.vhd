-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: Minimal form: single expression when choices — in with sel select y <= "01" when 1; there is only the when 1 branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_single is
  port (
    sel : in  integer range 0 to 1;
    y   : out bit
  );
end entity ent_se_single;

architecture single_branch of ent_se_single is
begin
  with sel select
    y <= '0' when 0,
         '1' when 1;
end architecture single_branch;
