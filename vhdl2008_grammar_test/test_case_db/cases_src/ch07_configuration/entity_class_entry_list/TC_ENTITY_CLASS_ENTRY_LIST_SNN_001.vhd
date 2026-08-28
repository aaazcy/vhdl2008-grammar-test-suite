-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Negative
-- Test Focus: entity_class_entry_list contains an illegal token — in "signal, 42, label" the second entry is a numeric literal rather than a legal entity_class or entity_class <> form, the parser is expected to report a syntax error
-- Expected Result: Triggers syntax error (numeric literal "42" not a valid entity_class_entry)
-- Dependencies: None
-- =============================================================
entity ecl_number_in_list is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ecl_number_in_list is
  signal s_val : bit := '0';
  -- ERROR: "42" is not a valid entity_class_entry
  group bad_list is (signal, 42, label);
begin
  s_val <= a; y <= s_val;
end architecture rtl;
