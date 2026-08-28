-- =============================================================
-- Case ID: TC_SEM_ENT_002_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_ENT_002
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: port names within the same entity must be unique — duplicate port names trigger declaration_elaboration_error
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative example 1: 2 signals in the port list are both named "data" (one in, one out), verifying the analyzer detects duplicate interface_signal_declaration identifiers in the port_clause scope of the entity
-- Expected Result: Triggers semantic error: duplicate port name in entity
-- Dependencies: None
-- =============================================================
entity ent_dup_port is
  port(
    data : in  bit_vector(7 downto 0);
    data : out bit_vector(7 downto 0)
  );
end entity ent_dup_port;
