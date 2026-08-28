-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ATTRIBUTE_DESIGNATOR_002
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Negative
-- Rule Description: When used in an attribute_specification, the attribute_designator must already be declared; otherwise the specification has no corresponding attribute to attach to
-- Error Category: Undeclared attribute reference
-- Test Focus: SMN: an undeclared attribute_designator used in an attribute specification — 'unknown_attr' is used directly as the attribute designator in the specification without first creating the attribute through an attribute declaration, causing a semantic error
-- Expected Result: Triggers semantic error (attribute not declared)
-- Dependencies: None
-- =============================================================
entity attr_desig_undecl is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of attr_desig_undecl is
  -- ERROR: 'unknown_attr' not declared with 'attribute unknown_attr : type;'
  signal buf : bit := '0';
  attribute unknown_attr of buf : signal is 42;
begin
  buf <= d;
  q <= buf;
end architecture vhdl2008;
