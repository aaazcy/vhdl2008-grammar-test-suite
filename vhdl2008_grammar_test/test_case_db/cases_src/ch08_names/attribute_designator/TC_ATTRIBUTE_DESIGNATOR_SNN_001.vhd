-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Negative
-- Test Focus: SNN: missing attribute_designator — in the attribute declaration the keyword is directly followed by a colon ('attribute : integer'), missing the required attribute_simple_name as the designator identifier
-- Expected Result: Triggers syntax error at missing attribute_simple_name
-- Dependencies: None
-- =============================================================
entity attr_desig_missing is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of attr_desig_missing is
  -- ERROR: 'attribute' keyword must be followed by attribute_simple_name
  attribute : integer;
begin
  q <= d;
end architecture vhdl2008;
