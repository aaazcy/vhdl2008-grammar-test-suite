-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit ::= entity_declaration | configuration_declaration | package_declaration | package_instantiation_declaration | context_declaration | PSL_Verification_Unit
-- Case Type: Positive
-- Test Focus: primary_unit as entity_declaration with simple port
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pu_syn_entity is port(dout:out integer); end entity;
architecture rtl of pu_syn_entity is
begin
  dout<=0;
end architecture rtl;
