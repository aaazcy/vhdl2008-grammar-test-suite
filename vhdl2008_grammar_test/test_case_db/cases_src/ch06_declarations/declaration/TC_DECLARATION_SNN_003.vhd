-- =============================================================
-- Case ID: TC_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration | object_declaration | interface_declaration | alias_declaration | attribute_declaration | component_declaration | group_template_declaration | group_declaration | ...
-- Case Type: Negative
-- Test Focus: ERROR: declaration in wrong context - signal declaration attempted inside an entity declarative region without proper syntax.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity declaration_snn3 is
  signal s_bad : bit
end entity declaration_snn3;

architecture arch of declaration_snn3 is
begin
end architecture arch;
