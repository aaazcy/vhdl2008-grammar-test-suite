-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Negative
-- Test Focus: missing "is" keyword
-- Expected Result: Triggers syntax error: missing "is"
-- Dependencies: None
-- =============================================================
entity arch_snn3_ent is port(a:in bit; y:out bit); end entity;
architecture behav of arch_snn3_ent begin y<=a; end architecture behav;
