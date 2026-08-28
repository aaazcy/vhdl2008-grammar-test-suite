-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon between generic clause and port clause—`generic(G:integer:=1) port(x:in bit)` omits the required semicolon terminator after the generic clause's closing parenthesis; the BNF production defines two distinct optional clauses and a semicolon is required to separate them, so the parser encountering `port` immediately after `)` without an intervening `;` reports a missing semicolon error
-- Expected Result: Triggers syntax error: missing ";" between generic and port clause
-- Dependencies: None
-- =============================================================
entity eh_missing_semi is
  generic(
    G : integer := 1
  )
  port(
    x : in bit
  );
end entity eh_missing_semi;
