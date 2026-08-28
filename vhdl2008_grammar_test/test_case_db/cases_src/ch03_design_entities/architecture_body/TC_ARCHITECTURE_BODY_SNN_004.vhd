-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Negative
-- Test Focus: missing "begin" before statements
-- Expected Result: Triggers syntax error: missing "begin"
-- Dependencies: None
-- =============================================================
entity arch_snn4_ent is port(a:in bit; y:out bit); end entity;
architecture behav of arch_snn4_ent is signal s:bit; y<=a; end architecture behav;
