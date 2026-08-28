-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Positive
-- Test Focus: entity_name_list with multiple entity_designators — comma-separated list of entity_designators in attribute_specification, testing the { , entity_designator } repetition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enl_multi_ent is
  port(a : in bit; b : in bit; y : out bit);
  attribute pin_loc : string;
  attribute pin_loc of a, b, y : signal is "bank1";
end entity;

architecture bh of enl_multi_ent is
  signal s_a, s_b, s_y : bit := '0';
begin
  s_a <= a; s_b <= b;
  s_y <= s_a and s_b;
  y <= s_y;
end architecture bh;
