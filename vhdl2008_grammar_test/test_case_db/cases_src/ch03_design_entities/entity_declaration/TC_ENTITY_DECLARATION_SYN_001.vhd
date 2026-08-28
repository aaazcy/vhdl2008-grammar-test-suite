-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Minimal entity: identifier+is only, no generic_clause, no port_clause, no declarative part, no statement part, end entity includes the identifier——verifying both entity_header and entity_declarative_part may be empty in the BNF
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity minimal is
end entity minimal;
