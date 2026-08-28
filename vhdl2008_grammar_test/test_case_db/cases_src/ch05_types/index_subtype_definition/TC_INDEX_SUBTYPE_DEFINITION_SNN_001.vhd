-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Negative
-- Test Focus: Missing the "range" keyword in index_subtype_definition.
--            The BNF requires "type_mark range <>". Omitting "range"
--            breaks the production.
-- Expected Result: Triggers syntax error (missing "range")
-- Dependencies: None
-- =============================================================
entity bad_index_no_range is
  port (
    d : out integer
  );
end entity bad_index_no_range;

architecture rtl of bad_index_no_range is
  -- ERROR: missing "range" keyword before "<>"
  type bad_arr is array (integer <>) of bit;
  signal s : bad_arr(0 to 7);
begin
  d <= 0;
end architecture rtl;
