-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Negative
-- Test Focus: array_type_definition missing the "of" keyword before
--            element_subtype_indication. The BNF requires "array
--            index_constraint of element_subtype_indication" —
--            omitting "of" breaks the production.
-- Expected Result: Triggers syntax error (missing "of")
-- Dependencies: None
-- =============================================================
entity bad_array_no_of is
  port (
    d : out integer
  );
end entity bad_array_no_of;

architecture rtl of bad_array_no_of is
  -- ERROR: missing "of" keyword between index_constraint and element
  type bad_arr is array (0 to 7) integer range 0 to 255;
  signal s : bad_arr;
begin
  d <= 0;
end architecture rtl;
