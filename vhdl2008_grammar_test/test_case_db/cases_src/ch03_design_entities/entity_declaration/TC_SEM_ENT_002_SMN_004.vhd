-- =============================================================
-- Case ID: TC_SEM_ENT_002_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_ENT_002
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: port names within the same entity must be unique — port names must not conflict with generic names either (shared declaration space)
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative example 2: entity has a generic named "WIDTH" and also a port named "WIDTH", verifying generic_clause and port_clause share the declaration space in entity_header — generic names and port names must not duplicate
-- Expected Result: Triggers semantic error: port name conflicts with generic name
-- Dependencies: None
-- =============================================================
entity ent_port_gen_conflict is
  generic(WIDTH : integer := 8);
  port(
    WIDTH : in bit_vector(7 downto 0)
  );
end entity ent_port_gen_conflict;
