-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Negative
-- Test Focus: SNN: index_subtype_definition missing the type mark - in 'array (range <>)' there is no type_mark before "range <>", verifying index_subtype_definition requires the complete type_mark range <> form
-- Expected Result: Triggers syntax error: unexpected token 'range' in a primary
-- Dependencies: None
-- =============================================================
entity isd_ent is end entity;
architecture rtl of isd_ent is
  type bad_arr is array (range <>) of integer;
begin
end architecture;
