-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Negative
-- Test Focus: SNN: illegal attribute_designator starting with a digit — '1wire_delay' starts with a digit and does not conform to the syntax rules of an identifier (which must start with a letter or underscore), so it is not a legal attribute_simple_name
-- Expected Result: Triggers syntax error at invalid identifier
-- Dependencies: None
-- =============================================================
entity attr_desig_badid is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of attr_desig_badid is
  -- ERROR: '1wire_delay' starts with digit, not a valid simple_name
  attribute 1wire_delay : time;
begin
  q <= d;
end architecture vhdl2008;
