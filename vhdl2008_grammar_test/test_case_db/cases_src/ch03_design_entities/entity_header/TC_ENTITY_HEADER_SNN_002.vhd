-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: entity_header: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_header_e2 is end entity;
architecture bh of entity_header_e2 is
  -- ERROR: invalid syntax in entity_header
  signal s : bit;
begin
  s <= '1'
end architecture bh;