-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: minimal: empty declarative, single assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_min_ent is port(a:in bit; y:out bit); end entity;
architecture minimal of arch_min_ent is begin y<=a; end architecture minimal;
