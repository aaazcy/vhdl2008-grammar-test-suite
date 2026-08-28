-- =============================================================
-- Case ID: TC_SEM_ENT_001_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ENT_001
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: entity names must be unique within the same design library — coexistence of differently named entities is legal semantic behavior
-- Case Type: Positive
-- Error Category: declaration_elaboration_error
-- Test Focus: Positive example: 2 entities named ent_a and ent_b respectively, each with its own port and architecture, verifying differently named entities can coexist in the same design file without triggering a name conflict
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_a is
  port(x : in bit; z : out bit);
end entity ent_a;
architecture bh of ent_a is
begin z <= x; end architecture bh;

entity ent_b is
  port(a, b : in integer; sum : out integer);
end entity ent_b;
architecture bh of ent_b is
begin sum <= a + b; end architecture bh;
