-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Positive
-- Test Focus: entity_header with both optional clauses omitted entirely—the entity declares neither generic nor port, validating that `[generic_clause]` and `[port_clause]` are each independently optional and can both be absent simultaneously, producing the minimal legal entity header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity eh_empty is
end entity eh_empty;
