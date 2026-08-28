-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SMN_SELECTED_EXPRESSIONS_MISSING_OTHERS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Rule Description: If the choices do not cover all values of the selector type, an 'others' choice is required.
-- Error Category: Incomplete coverage
-- Test Focus: SMN: missing others branch and incomplete coverage — selector is integer range 0 to 3 (4 values), but only when 0 and when 1 are listed, neither 2 and 3 nor others are covered
-- Expected Result: Triggers semantic error: choices do not cover all values of selector type, 'others' required
-- Dependencies: None
-- =============================================================

entity se_smn_no_others is
  port (
    sel : in  integer range 0 to 3;
    y   : out bit
  );
end entity se_smn_no_others;

architecture missing_others of se_smn_no_others is
begin
  with sel select
    y <= '0' when 0,
         '1' when 1;  -- ERROR: values 2 and 3 not covered, no 'others'
end architecture missing_others;
