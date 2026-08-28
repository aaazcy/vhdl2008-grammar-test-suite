-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Case Type: Negative
-- Test Focus: SNN: duplicate identifiers in the entity declarative part — two signals both named s_dup conflict
-- Expected Result: Triggers error: duplicate identifier
-- Dependencies: None
-- =============================================================
entity edi_snn2_ent is port(a:in bit); end entity;
architecture bh of edi_snn2_ent is
  signal s_dup:bit:='0'; signal s_dup:bit:='1';
begin end architecture bh;
