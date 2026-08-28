-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Negative
-- Test Focus: Keyword "generic" used as an entity_class - "generic" is a legal VHDL contextual keyword but is not contained in the entity_class set, verifying the parser correctly distinguishes general keywords from the entity_class-specific set
-- Expected Result: Triggers syntax error ("generic" is not a valid entity_class)
-- Dependencies: None
-- =============================================================
entity ec_generic_class is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ec_generic_class is
  attribute note : string;
  signal s_val : bit := '0';
  -- ERROR: "generic" is not one of the 20 valid entity_class keywords
  attribute note of ec_generic_class : generic is "bad_class";
begin
  s_val <= a; y <= s_val;
end architecture rtl;
