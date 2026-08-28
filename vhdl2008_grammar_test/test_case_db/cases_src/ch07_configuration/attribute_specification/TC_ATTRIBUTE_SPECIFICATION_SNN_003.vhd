-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Negative
-- Test Focus: Missing 'is' keyword before expression — the production requires 'is' between entity_specification and expression; omitting it breaks the syntax
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity attr_spec_snn3_ent is port(r:out integer); end entity;
architecture bh of attr_spec_snn3_ent is
  attribute tag : string;
  -- ERROR: missing 'is' keyword before expression
  attribute tag of bh : architecture "missing_is_keyword";
  signal s:integer:=0;
begin s<=1; r<=s; end architecture bh;
