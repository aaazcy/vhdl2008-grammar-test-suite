-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_LIBRARY_UNIT_AMBIGUOUS_ARCH
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Negative
-- Rule Description: the same entity cannot have two architecture_body units with the same name
-- Error Category: duplicate declaration — the same entity has two architecture bodies with the same name
-- Test Focus: duplicate architecture name: entity lu_dup_ent ..., architecture same of lu_dup_ent ..., architecture same of lu_dup_ent — two secondary_unit (architecture_body) declarations use the same architecture name "same" bound to the same entity, verifies semantic analysis detects the duplicate architecture name error
-- Expected Result: Triggers semantic error: duplicate architecture "same" for entity "lu_dup_ent"
-- Dependencies: None
-- =============================================================
entity lu_dup_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity lu_dup_ent;

architecture same of lu_dup_ent is
begin
  y <= a;
end architecture same;

-- ERROR: duplicate architecture name for same entity
architecture same of lu_dup_ent is
begin
  y <= not a;
end architecture same;
