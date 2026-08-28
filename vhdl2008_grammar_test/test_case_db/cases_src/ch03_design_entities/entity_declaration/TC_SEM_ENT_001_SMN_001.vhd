-- =============================================================
-- Case ID: TC_SEM_ENT_001_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ENT_001
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: entity names must be unique within the same design library — duplicate entity names trigger declaration_elaboration_error
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative example 1: 2 entities both named ent_dup, the second declaration finds an identifier conflict in the same scope, verifying the analyzer enforces the uniqueness check on entity_simple_name and rejects duplicate names
-- Expected Result: Triggers semantic error: duplicate entity name in design library
-- Dependencies: None
-- =============================================================
entity ent_dup is
  port(a : in bit; y : out bit);
end entity ent_dup;
architecture bh of ent_dup is
begin y <= a; end architecture bh;

entity ent_dup is
  port(x : in bit; z : out bit);
end entity ent_dup;
