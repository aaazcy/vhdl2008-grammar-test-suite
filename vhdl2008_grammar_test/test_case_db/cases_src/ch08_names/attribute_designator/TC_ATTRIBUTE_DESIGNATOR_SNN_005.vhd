-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Negative
-- Test Focus: SNN: an operator symbol as attribute_designator — '"+"' is an operator symbol, not a legal simple_name, so it cannot be used as an attribute_designator
-- Expected Result: Triggers syntax error at operator symbol used as designator
-- Dependencies: None
-- =============================================================
entity attr_desig_opsym is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of attr_desig_opsym is
  -- ERROR: '+' operator symbol is not a valid attribute_simple_name
  attribute "+" : integer;
begin
  q <= d;
end architecture vhdl2008;
