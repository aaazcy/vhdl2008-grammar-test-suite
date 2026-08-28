-- =============================================================
-- Case ID: TC_PORT_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_clause ::= port ( port_list ) ;
-- Case Type: Negative
-- Test Focus: ERROR: port clause missing the closing semicolon. BNF requires "port ( port_list ) ;" with trailing ";".
-- Expected Result: Triggers syntax error (missing semicolon)
-- Dependencies: None
-- =============================================================
entity port_clause_snn1 is
  port (
    clk : in bit;
    data : in bit_vector(7 downto 0)
  )
end entity port_clause_snn1;

architecture arch of port_clause_snn1 is
begin
end architecture arch;
