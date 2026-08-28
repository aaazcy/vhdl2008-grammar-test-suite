-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_005
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive
-- Test Focus: the simplest list formed by a single entity_class_entry — only one "signal" entry in the group template, verifies the minimal legal form of entity_class_entry_list is a single entry without comma repetition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ecl_single_entry is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ecl_single_entry is
  signal s_buf : bit := '0';
  group buf_path is (signal);
  group bp : buf_path (s_buf);
begin
  s_buf <= a;
  y <= s_buf;
end architecture rtl;
