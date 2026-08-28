-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SNN_005
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Negative
-- Test Focus: the box marker with a space in the middle "< >" instead of the legal compact form "<>" — the optional box in entity_class_entry must be written exactly as "<>", the parser treats the space inside "< >" as an illegal token separation
-- Expected Result: Triggers syntax error (invalid box token: "< >" with internal space)
-- Dependencies: None
-- =============================================================
entity ece_box_with_space is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ece_box_with_space is
  signal s_val : bit := '0';
  -- ERROR: "< >" with space inside is not valid box syntax; must be "<>"
  group bad_box is (signal < >, label);
begin
  s_val <= a; y <= s_val;
end architecture rtl;
