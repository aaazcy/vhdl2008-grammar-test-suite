-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Negative
-- Test Focus: Missing semicolon at end of attribute_specification — the production requires a terminating semicolon; omitting it leaves the statement incomplete and causes a parser error
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity as_snn5_ent is port(r:out integer); end entity;
architecture bh of as_snn5_ent is
  attribute tag : string;
  -- ERROR: missing terminating semicolon
  attribute tag of bh : architecture is "missing_semicolon"
  signal s:integer:=0;
begin s<=1; r<=s; end architecture bh;
