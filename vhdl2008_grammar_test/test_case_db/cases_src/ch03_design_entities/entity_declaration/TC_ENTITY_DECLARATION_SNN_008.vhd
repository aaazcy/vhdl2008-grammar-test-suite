-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SNN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: Entity name mismatch with identifier after end — `entity bad_name is port(x:in bit); end entity wrong_name;`, the entity_simple_name at declaration differs from the identifier after end, verifying the parser consistency check on entity_simple_name
-- Expected Result: Triggers syntax error: entity name mismatch at end
-- Dependencies: None
-- =============================================================
entity bad_name is
  port(x:in bit);
end entity wrong_name;
