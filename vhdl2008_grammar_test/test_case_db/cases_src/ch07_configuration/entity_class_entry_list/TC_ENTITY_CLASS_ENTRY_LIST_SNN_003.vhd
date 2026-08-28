-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SNN_003
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Negative
-- Test Focus: Missing comma between entity_class_entry items — "signal signal" without comma separator violates the comma-delimited list grammar
-- Expected Result: Triggers syntax error (missing comma separator)
-- Dependencies: None
-- =============================================================
entity ecl_no_comma is
  port(a : in integer; y : out integer);
end entity;

architecture bh of ecl_no_comma is
  -- ERROR: missing comma between entity_class_entry items
  group bad_path is (signal signal);
  signal s_a, s_y : integer := 0;
  group bp : bad_path (s_a, s_y);
begin
  s_a <= a; y <= s_a; s_y <= s_a + 1;
end architecture bh;
