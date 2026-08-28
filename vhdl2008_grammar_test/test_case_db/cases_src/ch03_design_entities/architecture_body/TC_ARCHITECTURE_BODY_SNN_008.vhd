-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SNN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: name after end architecture mismatches the declared name — `end architecture wrong_name`, where wrong_name ≠ the identifier rtl used at architecture declaration, verifying the parser checks architecture_simple_name consistency
-- Expected Result: Triggers syntax error: architecture_simple_name mismatch
-- Dependencies: None
-- =============================================================
entity arch_snn8_ent is port(a:in bit; y:out bit); end entity;
architecture rtl of arch_snn8_ent is begin y<=a; end architecture wrong_name;
