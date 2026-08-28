-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SNN: missing closing parenthesis in the formal_generic_clause—`generic(G:integer:=1; H:boolean` opens the generic clause with `(` but never closes it with `)`, so the parser encounters `port` while still inside the unclosed generic clause parenthesized scope; the error manifests as an unexpected `port` token where `)` or another generic declaration was expected, validating that the optional generic clause requires balanced parentheses
-- Expected Result: Triggers syntax error: missing ")" in generic clause
-- Dependencies: None
-- =============================================================
entity eh_unclosed_gen is
  generic(
    G : integer := 1;
    H : boolean
  port(
    x : in bit
  );
end entity eh_unclosed_gen;
