-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SMN: port subtype_indication references an undeclared generic name—`generic(G_W:integer:=8); port(din:in bit_vector(WIDTH-1 downto 0))` refers to `WIDTH` in the port constraint, but the generic clause only declares `G_W`; the identifier `WIDTH` is not visible in the entity header scope, so the semantic analyzer must reject the port's subtype_indication for referencing an undeclared name within the same entity_header declarative region
-- Expected Result: Triggers semantic error: WIDTH is not declared in entity_header scope
-- Dependencies: None
-- =============================================================
entity eh_undefined_gen_ref is
  generic(
    G_W : integer := 8
  );
  port(
    din : in bit_vector(WIDTH - 1 downto 0)
  );
end entity eh_undefined_gen_ref;
