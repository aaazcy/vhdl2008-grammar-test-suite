-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SNN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: keyword order error — `architecture is ent_name of arch_snn9_ent`, where "is" appears before "entity_name of" instead of after, verifying the parser requires the strict `identifier of entity_name is` order
-- Expected Result: Triggers syntax error: keyword ordering violation
-- Dependencies: None
-- =============================================================
entity arch_snn9_ent is port(a:in bit; y:out bit); end entity;
architecture is arch_snn9_ent of rtl begin y<=a; end architecture rtl;
