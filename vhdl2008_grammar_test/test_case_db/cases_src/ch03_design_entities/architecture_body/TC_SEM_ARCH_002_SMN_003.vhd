-- =============================================================
-- Case ID: TC_SEM_ARCH_002_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_002
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: The entity_name of architecture_body must reference a declared entity - referencing a nonexistent entity triggers scope_visibility_error
-- Case Type: Negative
-- Error Category: scope_visibility_error
-- Test Focus: Negative case 1: architecture references entity_name "nonexistent_entity", the name has no entity declaration anywhere in the design file, verifying the analyzer performs name resolution in the entity_name slot and rejects the undeclared reference
-- Expected Result: Triggers semantic error: entity_name does not reference a declared entity
-- Dependencies: None
-- =============================================================
entity sem_arch_002_works is
  port(x:in bit; z:out bit);
end entity;
architecture bh of nonexistent_entity is
begin
end architecture bh;
