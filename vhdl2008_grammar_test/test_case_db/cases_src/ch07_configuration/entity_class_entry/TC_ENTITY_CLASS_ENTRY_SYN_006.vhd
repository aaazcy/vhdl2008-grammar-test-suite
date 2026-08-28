-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_006
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive
-- Test Focus: minimal entity_class_entry with box — a single "signal <>" entry forms the simplest group template, verifies the minimal legal form of a single entity_class_entry with box
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ece_single_box is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ece_single_box is
  signal s_buf : bit := '0';
  group any_signal is (signal <>);
  group asg : any_signal (s_buf);
begin
  s_buf <= a;
  y <= s_buf;
end architecture rtl;
