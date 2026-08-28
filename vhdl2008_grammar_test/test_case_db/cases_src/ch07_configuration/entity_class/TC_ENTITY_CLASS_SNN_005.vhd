-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SNN_005
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Negative
-- Test Focus: User-defined identifier used in the entity_class position - "myclass" is not a member of the entity_class reserved word set, expecting the parser to reject arbitrary identifiers in the entity_class position
-- Expected Result: Triggers syntax error (user identifier "myclass" is not valid entity_class)
-- Dependencies: None
-- =============================================================
entity ec_user_id_class is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ec_user_id_class is
  attribute note : string;
  signal s_val : bit := '0';
  -- ERROR: "myclass" is not one of the 20 valid entity_class keywords
  attribute note of ec_user_id_class : myclass is "bad";
begin
  s_val <= a; y <= s_val;
end architecture rtl;
