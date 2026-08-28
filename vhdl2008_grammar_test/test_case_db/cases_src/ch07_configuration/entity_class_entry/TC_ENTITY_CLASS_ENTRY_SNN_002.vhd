-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Negative
-- Test Focus: Invalid entity_class name — 'register' is not a valid entity_class keyword; entity_class must be one of the reserved class names (entity, architecture, signal, etc.)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ece_snn2_ent is port(r:out integer); end entity;
architecture bh of ece_snn2_ent is
  -- ERROR: 'register' is not a valid entity_class
  group bad_grp is (register, register);
  signal s : integer := 0;
begin
  s <= 1; r <= s;
end architecture bh;
