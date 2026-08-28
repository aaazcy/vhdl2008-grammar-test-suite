-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_001
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive
-- Test Focus: Entity class entry list with two entries — exercises "signal, signal" (two entity_class_entry items without boxes) in a group template declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ecl_simple is
  port(a,b : in integer; y : out integer);
end entity;

architecture bh of ecl_simple is
  group data_path is (signal, signal);
  signal s_a, s_b : integer := 0;
  group dp : data_path (s_a, s_b);
begin
  s_a <= a; s_b <= b; y <= s_a + s_b;
end architecture bh;
