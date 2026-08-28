-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SNN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon after end — `end architecture rtl` has no `;` after it, the next line is another legal architecture definition, verifying the architecture closure must be terminated by a semicolon, otherwise the parser cannot distinguish the boundary of two adjacent architectures
-- Expected Result: Triggers syntax error: missing semicolon after end
-- Dependencies: None
-- =============================================================
entity arch_snn10_ent is port(a:in bit; y:out bit); end entity;
architecture rtl of arch_snn10_ent is begin y<=a; end architecture rtl
architecture beh of arch_snn10_ent is begin y<=not a; end architecture beh;
