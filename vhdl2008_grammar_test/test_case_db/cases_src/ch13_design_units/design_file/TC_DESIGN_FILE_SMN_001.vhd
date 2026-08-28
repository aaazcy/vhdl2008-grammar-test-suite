-- =============================================================
-- Case ID: TC_DESIGN_FILE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_DESIGN_FILE_DUPLICATE_ENTITY
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Negative
-- Rule Description: the same entity name must not be declared in two design_units within the same design_file
-- Error Category: duplicate declaration - entity name conflict
-- Test Focus: duplicate entity name within the same design_file: two design_units each declare the entity df_dup_ent — verifying semantic analysis detects the error of defining the same entity name twice in one file
-- Expected Result: Triggers semantic error: duplicate entity declaration in same design file
-- Dependencies: None
-- =============================================================

entity df_dup_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity df_dup_ent;

architecture rtl of df_dup_ent is
begin
  y <= a;
end architecture rtl;

-- ERROR: duplicate entity name
entity df_dup_ent is
  port (
    b : in  bit;
    y : out bit
  );
end entity df_dup_ent;

architecture rtl of df_dup_ent is
begin
  y <= b;
end architecture rtl;
