-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Negative
-- Test Focus: Invalid entity_class keyword in entity_specification — using an unrecognized keyword 'wire' instead of a valid entity_class like 'signal' violates the entity_class grammar within entity_specification
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity as_snn7_ent is port(r:out integer); end entity;
architecture bh of as_snn7_ent is
  attribute width : integer;
  -- ERROR: 'wire' is not a valid entity_class keyword
  attribute width of r : wire is 8;
  signal s:integer:=0;
begin s<=1; r<=s; end architecture bh;
