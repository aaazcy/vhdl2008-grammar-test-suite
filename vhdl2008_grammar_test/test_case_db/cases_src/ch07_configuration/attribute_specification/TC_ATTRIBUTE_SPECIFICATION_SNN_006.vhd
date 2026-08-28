-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Negative
-- Test Focus: Missing expression after 'is' — the production requires 'is expression ;' where expression is mandatory; writing 'is ;' with no expression violates the grammar
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity as_snn6_ent is port(r:out integer); end entity;
architecture bh of as_snn6_ent is
  attribute note : string;
  -- ERROR: missing expression after 'is'
  attribute note of bh : architecture is ;
  signal s:integer:=0;
begin s<=1; r<=s; end architecture bh;
