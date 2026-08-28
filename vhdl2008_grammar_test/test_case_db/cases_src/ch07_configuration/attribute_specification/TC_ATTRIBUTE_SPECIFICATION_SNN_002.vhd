-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Negative
-- Test Focus: Missing 'attribute' keyword — attribute_specification must start with reserved word 'attribute'; omitting it violates the BNF production
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity attr_spec_snn2_ent is port(r:out integer); end entity;
architecture bh of attr_spec_snn2_ent is
  attribute mark:string;
  -- ERROR: missing 'attribute' keyword before the designator
  mark of bh:architecture is "bad_spec";
  signal s:integer:=0;
begin s<=1; r<=s; end architecture bh;
