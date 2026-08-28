-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: component_instantiation_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity component_insta_e3 is end entity;
architecture bh of component_insta_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;