-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_LIBRARY_UNIT_ARCH_MISMATCH
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Negative
-- Rule Description: architecture_body as secondary_unit, the entity name it references must match the entity name declared earlier
-- Error Category: name resolution error — architecture body and entity name mismatch
-- Test Focus: architecture references mismatched entity name: entity a_ent ..., architecture rtl of b_ent — the architecture's entity name b_ent is inconsistent with the previously declared entity name a_ent, verifies semantic analysis detects the entity name mismatch
-- Expected Result: Triggers semantic error: entity "b_ent" does not match declared entity "a_ent"
-- Dependencies: None
-- =============================================================
entity lu_ent_a is
  port (
    a : in  bit;
    y : out bit
  );
end entity lu_ent_a;

-- ERROR: architecture references different entity name
architecture rtl of lu_ent_b is
begin
  y <= a;
end architecture rtl;
