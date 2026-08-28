-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Negative
-- Test Focus: duplicate architecture name for same entity
-- Expected Result: Triggers semantic error: architecture name conflict
-- Dependencies: None
-- =============================================================
entity arch_snn7_ent is port(a:in bit; y:out bit); end entity;
architecture rtl of arch_snn7_ent is begin y<=a; end architecture rtl;
architecture rtl of arch_snn7_ent is begin y<=not a; end architecture rtl;
