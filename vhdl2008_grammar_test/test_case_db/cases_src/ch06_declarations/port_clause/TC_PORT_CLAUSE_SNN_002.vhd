-- =============================================================
-- Case ID: TC_PORT_CLAUSE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_clause ::= port ( port_list ) ;
-- Case Type: Negative
-- Test Focus: port_clause: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity port_clause_e2 is end entity;
architecture bh of port_clause_e2 is
  -- ERROR: invalid syntax in port_clause
  signal s : bit;
begin
  s <= '1'
end architecture bh;