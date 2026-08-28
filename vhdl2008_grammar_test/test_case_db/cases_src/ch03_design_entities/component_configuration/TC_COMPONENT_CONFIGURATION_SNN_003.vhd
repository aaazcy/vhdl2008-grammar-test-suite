-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification
-- Case Type: Negative
-- Test Focus: component_configuration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity component_confi_e3 is end entity;
architecture bh of component_confi_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;