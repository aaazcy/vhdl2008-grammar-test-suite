-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SNN: missing closing parenthesis in the formal_port_clause—`port(a:in bit; b:out integer` opens the port clause with `(` but never closes it, so the parser reaches `end entity` while still inside the unclosed port clause parenthesized scope; the BNF requires that every `(` in a port_clause has a matching `)`, and the missing closer causes the entity declaration to be malformed because the parser cannot find the port clause terminator
-- Expected Result: Triggers syntax error: missing ")" in port clause
-- Dependencies: None
-- =============================================================
entity eh_unclosed_port is
  port(
    a : in  bit;
    b : out integer
end entity eh_unclosed_port;
