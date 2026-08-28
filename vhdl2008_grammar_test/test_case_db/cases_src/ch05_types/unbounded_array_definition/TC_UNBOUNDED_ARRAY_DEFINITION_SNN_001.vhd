-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Missing the "array" keyword in an unbounded array
--            definition. The production must start with "array".
-- Expected Result: Triggers syntax error (missing "array")
-- Dependencies: None
-- =============================================================
entity bad_unbounded_no_array is
  port (
    d : out integer
  );
end entity bad_unbounded_no_array;

architecture rtl of bad_unbounded_no_array is
  -- ERROR: missing "array" keyword
  type bad_type is (integer range <>) of bit;
  signal s : bad_type;
begin
  d <= 0;
end architecture rtl;
