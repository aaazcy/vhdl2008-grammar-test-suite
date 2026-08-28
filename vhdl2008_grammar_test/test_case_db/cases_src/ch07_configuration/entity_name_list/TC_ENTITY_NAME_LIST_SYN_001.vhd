-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SYN_001
-- Rule Type: Syntax
-- BNF Production: ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Positive
-- Test Focus: Entity name list "all" alternative — exercises the "all" keyword as sole entity_name_list to apply attribute to all entities of a class
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enl_all_keyword is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of enl_all_keyword is
  attribute fanin : integer;
  signal s_a, s_b, s_y : bit := '0';
  attribute fanin of all : signal is 1;
begin
  s_a <= a; s_b <= b;
  s_y <= s_a or s_b;
  y <= s_y;
end architecture bh;
