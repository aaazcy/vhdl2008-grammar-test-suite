-- =============================================================
-- Case ID: TC_PORT_CLAUSE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_clause ::= port ( port_list ) ;
-- Case Type: Negative
-- Test Focus: ERROR: port clause missing the opening parenthesis. BNF requires "port ( port_list )" with parentheses.
-- Expected Result: Triggers syntax error (missing opening paren)
-- Dependencies: None
-- =============================================================
entity port_clause_snn4 is
  port
    clk : in bit;
    data : in bit
  );
end entity port_clause_snn4;

architecture arch of port_clause_snn4 is
begin
end architecture arch;
