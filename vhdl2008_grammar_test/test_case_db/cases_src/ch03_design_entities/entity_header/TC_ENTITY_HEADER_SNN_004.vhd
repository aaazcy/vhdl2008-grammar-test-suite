-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SNN: port clause appears before generic clause in entity_header—`port(x:in bit); generic(G:integer:=1);` reverses the BNF order which requires `[generic_clause]` before `[port_clause]`; the parser expects optional generic clause first, so encountering the `port` keyword when `generic` is still expected triggers a syntax error at the `port` token
-- Expected Result: Triggers syntax error: port clause before generic clause violates entity_header order
-- Dependencies: None
-- =============================================================
entity eh_port_before_gen is
  port(
    x : in bit
  );
  generic(
    G : integer := 1
  );
end entity eh_port_before_gen;
