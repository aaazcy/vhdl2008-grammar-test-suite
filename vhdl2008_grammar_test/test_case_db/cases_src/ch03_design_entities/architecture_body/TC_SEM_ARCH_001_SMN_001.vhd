-- =============================================================
-- Case ID: TC_SEM_ARCH_001_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_001
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: Architecture names of the same entity must be unique - a duplicate name triggers declaration_elaboration_error
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative case 1: 2 architectures of the same entity (sem_arch_001_ent2) are both named "duplicate_name", the second architecture declaration finds a name conflict within the entity scope, verifying architecture_simple_name uniqueness is enforced by the analyzer
-- Expected Result: Triggers semantic error: architecture name not unique within entity scope
-- Dependencies: None
-- =============================================================
entity sem_arch_001_ent2 is
  port(a:in bit; y:out bit);
end entity;
architecture duplicate_name of sem_arch_001_ent2 is
begin y<=a; end architecture duplicate_name;
architecture duplicate_name of sem_arch_001_ent2 is
begin y<=not a; end architecture duplicate_name;
