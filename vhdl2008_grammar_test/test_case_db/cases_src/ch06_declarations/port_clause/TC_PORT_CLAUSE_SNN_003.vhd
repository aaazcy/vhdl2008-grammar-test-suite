-- =============================================================
-- Case ID: TC_PORT_CLAUSE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_clause ::= port ( port_list ) ;
-- Case Type: Negative
-- Test Focus: port_clause: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity port_clause_e3 is end entity;
architecture bh of port_clause_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;