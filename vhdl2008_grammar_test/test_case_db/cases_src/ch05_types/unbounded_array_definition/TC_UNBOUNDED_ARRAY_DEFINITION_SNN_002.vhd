-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Multiple index_subtype_definitions must be separated
--            by commas. Missing the comma between two index
--            definitions breaks the production.
-- Expected Result: Triggers syntax error (missing comma)
-- Dependencies: None
-- =============================================================
entity bad_unbounded_no_comma is
  port (
    q : out integer
  );
end entity bad_unbounded_no_comma;

architecture rtl of bad_unbounded_no_comma is
  -- ERROR: missing comma between index_subtype_definitions
  type bad_2d is array (integer range <> natural range <>) of bit;
  signal s : bad_2d;
begin
  q <= 0;
end architecture rtl;
