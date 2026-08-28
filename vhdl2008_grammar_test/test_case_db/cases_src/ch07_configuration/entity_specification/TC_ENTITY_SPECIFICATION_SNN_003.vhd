-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SNN_003
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Negative
-- Test Focus: Invalid entity_class after colon — "a : register" uses an invalid entity_class keyword "register" instead of a valid one like "signal"
-- Expected Result: Triggers syntax error (invalid entity class)
-- Dependencies: None
-- =============================================================
entity espec_bad_class is
  port(a : in integer; y : out integer);
end entity;

architecture bh of espec_bad_class is
  attribute note : string;
  -- ERROR: "register" is not a valid entity_class keyword
  attribute note of a : register is "bad";
  signal s_val : integer := 0;
begin
  s_val <= a; y <= s_val;
end architecture bh;
