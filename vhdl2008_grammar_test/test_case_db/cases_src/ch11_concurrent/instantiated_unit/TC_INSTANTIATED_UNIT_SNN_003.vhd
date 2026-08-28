-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Case Type: Negative
-- Test Focus: instantiated_unit: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity instantiated_un_e3 is end entity;
architecture bh of instantiated_un_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;