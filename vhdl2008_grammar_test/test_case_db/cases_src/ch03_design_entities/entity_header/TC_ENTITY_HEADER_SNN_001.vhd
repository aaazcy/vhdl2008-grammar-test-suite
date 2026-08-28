-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SNN: generic_clause missing ";" — `generic(A:integer B:boolean)`, the separating semicolon is missing between the two interface_constant_declarations, verifying generic_list requires semicolons to separate multiple declarations
-- Expected Result: Triggers syntax error: missing ";" in generic clause
-- Dependencies: None
-- =============================================================
entity eh_bad_gen is
  generic(A:integer B:boolean);
  port(x:in bit);
end entity;
