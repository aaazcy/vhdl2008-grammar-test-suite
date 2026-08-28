-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SNN_002
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Negative
-- Test Focus: Invalid entity_class keyword "design" — not part of the enumerated set; only the 20 reserved entity_class names are valid
-- Expected Result: Triggers syntax error (invalid entity class)
-- Dependencies: None
-- =============================================================
entity ec_bad_class is
  port(a : in integer; y : out integer);
end entity;

architecture bh of ec_bad_class is
  attribute note : string;
  signal s_val : integer := 0;
  -- ERROR: "design" is not one of the 20 valid entity_class keywords
  attribute note of ec_bad_class : design is "bad";
begin
  s_val <= a; y <= s_val;
end architecture bh;
