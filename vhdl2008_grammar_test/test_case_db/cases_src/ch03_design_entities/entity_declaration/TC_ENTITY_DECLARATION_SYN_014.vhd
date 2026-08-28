-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_014
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Boundary — port only, no generic: entity contains a port_clause(3 ports in in/out/buffer modes, types integer/bit) but no generic_clause at all, verifying entity_header may contain only a port_clause and omit the generic_clause — the most common entity form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_no_gen is
  port(
    a, b : in  integer;
    sum  : out integer
  );
end entity ent_no_gen;
architecture bh of ent_no_gen is
begin
  sum <= a + b;
end architecture bh;
