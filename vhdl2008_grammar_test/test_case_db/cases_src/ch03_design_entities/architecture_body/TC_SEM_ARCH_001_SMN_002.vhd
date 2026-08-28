-- =============================================================
-- Case ID: TC_SEM_ARCH_001_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_001
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: Architecture names of the same entity must be unique - VHDL is case-insensitive, so names differing only in case are considered duplicates
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative case 2: the same entity has 2 architecture names "MY_ARCH" and "my_arch", which under VHDL case-insensitive rules should be treated as a same-name conflict, verifying the analyzer performs case normalization when comparing architecture_simple_name
-- Expected Result: Triggers semantic error: architecture name not unique (case-insensitive match)
-- Dependencies: None
-- =============================================================
entity sem_arch_001_ent3 is
  port(a:in bit; y:out bit);
end entity;
architecture MY_ARCH of sem_arch_001_ent3 is
begin y<=a; end architecture MY_ARCH;
architecture my_arch of sem_arch_001_ent3 is
begin y<=not a; end architecture my_arch;
