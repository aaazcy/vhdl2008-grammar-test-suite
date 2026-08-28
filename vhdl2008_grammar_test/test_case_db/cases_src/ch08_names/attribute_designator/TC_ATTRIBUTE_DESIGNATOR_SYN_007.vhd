-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Positive
-- Test Focus: Extended identifier as attribute_designator — the extended identifier \my_attr_name\ is used as the designator name of an attribute declaration, verifying that attribute_simple_name may be any identifier string escaped by backslashes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_extid_desig is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
  attribute \my_custom_attr\ : string;
  attribute \my_custom_attr\ of din : signal is "input_port_8bit";
end entity;

architecture vhdl2008 of attr_extid_desig is
  signal buf : bit_vector(7 downto 0) := X"00";
begin
  buf <= din;
  dout <= buf;
end architecture vhdl2008;
