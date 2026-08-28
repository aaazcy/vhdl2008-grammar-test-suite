-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: entity_header: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_header_e3 is end entity;
architecture bh of entity_header_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;