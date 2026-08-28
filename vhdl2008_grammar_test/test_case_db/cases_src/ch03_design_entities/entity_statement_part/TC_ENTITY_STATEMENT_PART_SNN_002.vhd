-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Negative
-- Test Focus: entity_statement_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_statemen_e2 is end entity;
architecture bh of entity_statemen_e2 is
  -- ERROR: invalid syntax in entity_statement_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;