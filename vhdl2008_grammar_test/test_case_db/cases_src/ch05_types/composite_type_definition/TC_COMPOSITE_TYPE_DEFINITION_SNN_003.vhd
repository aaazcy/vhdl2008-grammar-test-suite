-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Negative
-- Test Focus: Neither array nor record keyword used. The composite
--            type definition must start with either "array" or
--            "record". A bare range is not a valid composite
--            type definition.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_composite_no_keyword is
  port (
    x : out integer
  );
end entity bad_composite_no_keyword;

architecture rtl of bad_composite_no_keyword is
  -- ERROR: missing both "array" and "record" keywords
  type bad_comp is 0 to 7 of integer;
  signal s : bad_comp;
begin
  x <= 0;
end architecture rtl;
