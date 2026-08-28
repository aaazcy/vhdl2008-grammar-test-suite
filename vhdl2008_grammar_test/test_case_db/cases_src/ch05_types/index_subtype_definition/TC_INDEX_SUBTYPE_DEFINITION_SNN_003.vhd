-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Negative
-- Test Focus: Using a non-discrete type (real) as type_mark in
--            index_subtype_definition. Array indices must be
--            discrete types; real is not discrete.
-- Expected Result: Triggers type error (real not discrete)
-- Dependencies: None
-- =============================================================
entity bad_index_real_type is
  port (
    x : out integer
  );
end entity bad_index_real_type;

architecture rtl of bad_index_real_type is
  -- ERROR: real is not a discrete type, cannot be an array index
  type bad_arr is array (real range <>) of bit;
  signal s : bad_arr;
begin
  x <= 0;
end architecture rtl;
