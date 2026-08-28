-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Missing parentheses around index_constraint.
--            The "array" keyword must be immediately followed
--            by "( index_constraint )". Omitting the parentheses
--            breaks the production.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_constrained_no_parens is
  port (
    x : out integer
  );
end entity bad_constrained_no_parens;

architecture rtl of bad_constrained_no_parens is
  -- ERROR: index_constraint must be in parentheses
  type bad_arr is array 0 to 7 of integer range 0 to 255;
  signal s : bad_arr;
begin
  x <= 0;
end architecture rtl;
