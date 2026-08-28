-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Negative
-- Test Focus: array keyword without parenthesized index_constraint.
--            The array_type_definition requires "( index_constraint )"
--            immediately after the "array" keyword. Missing the
--            parentheses is a syntax error.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_array_no_parens is
  port (
    z : out bit
  );
end entity bad_array_no_parens;

architecture rtl of bad_array_no_parens is
  -- ERROR: "array" must be followed by "( index_constraint )"
  type bad_arr is array 0 to 7 of bit;
  signal s : bad_arr;
begin
  z <= '0';
end architecture rtl;
