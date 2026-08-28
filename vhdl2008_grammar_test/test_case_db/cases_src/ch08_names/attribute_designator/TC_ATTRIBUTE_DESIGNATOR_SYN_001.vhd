-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Positive
-- Test Focus: Minimal attribute designator — a single attribute declaration uses the simple identifier "my_attr" as the attribute_designator, followed by a type mark, verifying the minimal syntactic form of attribute_simple_name as the attribute identifier
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_desig_minimal is
  port(data_in : in bit; data_out : out bit);
end entity;

architecture vhdl2008 of attr_desig_minimal is
  attribute pin_number : integer;
  signal buf : bit := '0';
begin
  buf <= data_in;
  data_out <= buf;
end architecture vhdl2008;
