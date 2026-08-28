-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Negative
-- Test Focus: Reserved word "port" used as an entity_class - "port" is a VHDL reserved word but not among the 20 legal values of entity_class, verifying the parser rejects illegal entity_class keywords
-- Expected Result: Triggers syntax error ("port" is not a valid entity_class)
-- Dependencies: None
-- =============================================================
entity ec_port_class is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ec_port_class is
  attribute note : string;
  signal s_val : bit := '0';
  -- ERROR: "port" is not one of the 20 valid entity_class keywords
  attribute note of a : port is "input_port";
begin
  s_val <= a; y <= s_val;
end architecture rtl;
