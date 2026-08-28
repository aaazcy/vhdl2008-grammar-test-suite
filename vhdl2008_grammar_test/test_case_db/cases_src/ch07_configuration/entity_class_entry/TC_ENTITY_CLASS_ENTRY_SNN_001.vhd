-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Negative
-- Test Focus: missing comma separator between entity_class_entry entries in a group template — "signal label" has no required " , " separator in between, violating the syntax rule that entries in entity_class_entry_list must be separated by commas
-- Expected Result: Triggers syntax error (missing comma separator between entity_class entries)
-- Dependencies: None
-- =============================================================
entity ece_missing_comma is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ece_missing_comma is
  signal s_val : bit := '0';
  -- ERROR: missing comma between "signal" and "label" entries
  group bad_list is (signal label);
begin
  s_val <= a; y <= s_val;
end architecture rtl;
