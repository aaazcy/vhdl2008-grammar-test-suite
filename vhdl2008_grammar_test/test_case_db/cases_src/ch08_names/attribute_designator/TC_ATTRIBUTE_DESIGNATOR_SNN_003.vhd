-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Negative
-- Test Focus: Undefined attribute designator in attribute_name — using an attribute name 'sig'undefined_attr that has never been declared; the attribute_designator must reference a previously declared attribute
-- Expected Result: Triggers semantic error
-- Dependencies: None
-- =============================================================
entity attr_desig_snn3_ent is port(r:out integer); end entity;
architecture bh of attr_desig_snn3_ent is
  signal s : integer := 0;
begin
  s <= 1;
  r <= s'undefined_attr;  -- ERROR: 'undefined_attr' not a declared attribute
end architecture bh;
