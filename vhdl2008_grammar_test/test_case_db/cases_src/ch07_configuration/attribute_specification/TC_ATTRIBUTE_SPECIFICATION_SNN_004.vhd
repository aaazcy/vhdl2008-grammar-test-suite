-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Negative
-- Test Focus: Missing "of" keyword — "attribute note bh : architecture is ..." omits the required "of" between attribute_designator and entity_specification
-- Expected Result: Triggers syntax error (missing "of" keyword)
-- Dependencies: None
-- =============================================================
entity as_missing_of is
  port(a : in integer; y : out integer);
end entity;

architecture bh of as_missing_of is
  attribute note : string;
  -- ERROR: missing "of" keyword before entity_specification
  attribute note bh : architecture is "bad_spec";
  signal s_val : integer := 0;
begin
  s_val <= a; y <= s_val;
end architecture bh;
