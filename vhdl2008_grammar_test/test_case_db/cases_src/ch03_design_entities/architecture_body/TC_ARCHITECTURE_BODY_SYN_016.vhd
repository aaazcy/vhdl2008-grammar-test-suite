-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_016
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Minimal end form: empty declarative part + empty statement part, after end neither the "architecture" keyword nor the architecture name identifier is written, just `end;` — verifying both optional clauses `[ architecture ] [ architecture_simple_name ]` in the BNF can be omitted at the same time
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_bare_ent is
  port(a:in bit; y:out bit);
end entity;
architecture bare of arch_bare_ent is
begin
end;
