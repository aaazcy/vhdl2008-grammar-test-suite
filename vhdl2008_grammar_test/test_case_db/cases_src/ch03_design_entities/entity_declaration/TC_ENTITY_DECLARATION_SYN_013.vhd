-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_013
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Boundary — empty port list with generics only: entity contains 2 generics but the port list is empty `port()`, verifying an entity with a generic_clause and no port_clause is still legal (portless design units such as pure configuration/package entity scenarios)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_no_ports is
  generic(
    G_VERSION : integer := 1;
    G_AUTHOR  : string  := "test"
  );
end entity ent_no_ports;
architecture bh of ent_no_ports is
  constant C_VER : integer := G_VERSION;
begin
  assert C_VER > 0 report "invalid version" severity failure;
end architecture bh;
