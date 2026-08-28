-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SNN_005
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Negative
-- Test Focus: double comma appears in entity_class_entry_list — "signal,, label" has two consecutive commas in between, indicating an intent to leave a blank slot but the syntax requires one entity_class_entry between commas, the parser is expected to report a syntax error
-- Expected Result: Triggers syntax error (duplicate comma — empty entry between commas)
-- Dependencies: None
-- =============================================================
entity ecl_double_comma is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ecl_double_comma is
  signal s_val : bit := '0';
  -- ERROR: double comma creates an empty entry in the list
  group bad_list is (signal,, label);
begin
  s_val <= a; y <= s_val;
end architecture rtl;
