-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Case Type: Negative
-- Test Focus: instantiated_unit: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity instantiated_un_e2 is end entity;
architecture bh of instantiated_un_e2 is
  -- ERROR: invalid syntax in instantiated_unit
  signal s : bit;
begin
  s <= '1'
end architecture bh;