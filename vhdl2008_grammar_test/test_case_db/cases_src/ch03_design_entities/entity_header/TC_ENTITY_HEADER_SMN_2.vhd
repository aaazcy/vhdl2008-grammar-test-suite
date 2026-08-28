-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SEM: duplicate generic identifier in formal_generic_clause—`generic(G_W:integer:=8; G_W:boolean:=true)` declares the same identifier `G_W` twice within the generic clause; although the BNF syntax is valid (both are legal interface_constant_declarations), the VHDL scoping rules forbid duplicate declarations within the same declarative region, so the semantic analyzer must reject the duplicate `G_W` identifier in the entity header's generic list
-- Expected Result: Triggers semantic error: duplicate generic identifier G_W
-- Dependencies: None
-- =============================================================
entity eh_dup_gen is
  generic(
    G_W : integer := 8;
    G_W : boolean := true
  );
  port(
    din : in bit_vector(7 downto 0)
  );
end entity eh_dup_gen;
