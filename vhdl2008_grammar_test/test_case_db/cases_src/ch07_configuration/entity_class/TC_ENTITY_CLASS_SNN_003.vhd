-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SNN_003
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Negative
-- Test Focus: Missing entity_class entirely — "attribute note of ec_ent :" has colon but no entity_class keyword follows, violating entity_specification ::= entity_name_list : entity_class
-- Expected Result: Triggers syntax error (missing entity class after colon)
-- Dependencies: None
-- =============================================================
entity ec_no_class is
  port(a : in integer; y : out integer);
end entity;

architecture bh of ec_no_class is
  attribute note : string;
  signal s_val : integer := 0;
  -- ERROR: missing entity_class after ":"
  attribute note of ec_no_class : is "no_class";
begin
  s_val <= a; y <= s_val;
end architecture bh;
