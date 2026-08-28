-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Negative
-- Test Focus: Invalid box syntax — '<<' instead of '<>' in entity_class_entry; the box token is specifically '<>', other angle-bracket combinations are not valid
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ece_snn3_ent is port(r:out integer); end entity;
architecture bh of ece_snn3_ent is
  -- ERROR: '<<' is not valid box syntax, must be '<>'
  group bad_grp is (signal <<, signal <<);
  signal s : integer := 0;
begin
  s <= 1; r <= s;
end architecture bh;
