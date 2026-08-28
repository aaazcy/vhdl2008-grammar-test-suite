-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_008
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive
-- Test Focus: two-entry entity_class_entry_list all with box — the "signal <>, signal <>" list, verifies parsing correctness of the minimal repetition (one comma separation) combined with all-box forms
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ecl_two_box is
  port(a : in bit_vector(1 downto 0); y : out bit_vector(1 downto 0));
end entity;

architecture rtl of ecl_two_box is
  signal s_d0, s_d1 : bit := '0';
  group bus_signals is (signal, signal <>);
  group bs : bus_signals (s_d0, s_d1);
begin
  s_d0 <= a(0);
  s_d1 <= a(1);
  y(0) <= s_d0;
  y(1) <= s_d1;
end architecture rtl;
