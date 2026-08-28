-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Negative
-- Test Focus: Reserved word as attribute_designator — 'signal' is a reserved word, cannot be used as an attribute_simple_name/designator; violates the identifier rule underlying attribute_designator
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity attr_desig_snn2_ent is port(r:out integer); end entity;
architecture bh of attr_desig_snn2_ent is
  attribute signal : string;  -- ERROR: 'signal' is reserved word, not valid attribute_simple_name
  signal s : integer := 0;
begin
  s <= 1;
  r <= s;
end architecture bh;
