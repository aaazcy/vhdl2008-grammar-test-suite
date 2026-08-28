-- =============================================================
-- Case ID: TC_SEM_ENT_003_SMN_005
-- Rule Type: Semantic
-- Related Rule ID: SEM_ENT_003
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: generic names within the same entity must be unique — duplicate generic names trigger declaration_elaboration_error
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative example: entity has 2 generics both named "DEPTH" (one integer, one time), verifying the analyzer detects duplicate interface_constant_declaration identifiers in the generic_clause scope of the entity
-- Expected Result: Triggers semantic error: duplicate generic name in entity
-- Dependencies: None
-- =============================================================
entity ent_dup_gen is
  generic(
    DEPTH : integer := 16;
    DEPTH : time    := 10 ns
  );
  port(x : in bit);
end entity ent_dup_gen;
