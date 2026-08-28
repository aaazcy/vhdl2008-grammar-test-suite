-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification
-- Case Type: Negative
-- Test Focus: component_configuration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity component_confi_e2 is end entity;
architecture bh of component_confi_e2 is
  -- ERROR: invalid syntax in component_configuration
  signal s : bit;
begin
  s <= '1'
end architecture bh;