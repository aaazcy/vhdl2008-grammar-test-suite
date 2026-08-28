-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Negative
-- Test Focus: access_type_definition: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity access_type_def_e2 is end entity;
architecture bh of access_type_def_e2 is
  -- ERROR: invalid syntax in access_type_definition
  signal s : bit;
begin
  s <= '1'
end architecture bh;