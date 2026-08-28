-- =============================================================
-- Case ID: TC_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration | object_declaration | interface_declaration | alias_declaration | attribute_declaration | component_declaration | group_template_declaration | group_declaration | ...
-- Case Type: Negative
-- Test Focus: ERROR: invalid declaration syntax - missing identifier in type_declaration, violating the BNF declaration production.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity declaration_snn2 is
end entity declaration_snn2;

architecture arch of declaration_snn2 is
  type is range 0 to 15;
begin
end architecture arch;
