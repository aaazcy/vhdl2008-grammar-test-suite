-- =============================================================
-- Case ID: TC_DESIGN_FILE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_DESIGN_FILE_ORPHAN_ARCH
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Negative
-- Rule Description: the entity corresponding to an architecture_body as a secondary_unit must be defined earlier in the design_file
-- Error Category: name resolution error - architecture body references an undefined entity
-- Test Focus: architecture body references a nonexistent entity: architecture rtl of nonexistent_ent — the entity name referenced by the architecture in the secondary_unit was never declared in the design file, verifying semantic analysis detects the unresolvable entity name
-- Expected Result: Triggers semantic error: entity "nonexistent_ent" not found in design file
-- Dependencies: None
-- =============================================================

entity df_ok_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity df_ok_ent;

architecture rtl of df_ok_ent is
begin
  y <= a;
end architecture rtl;

-- ERROR: architecture references non-existent entity
architecture rtl of nonexistent_ent is
begin
  null;
end architecture rtl;
