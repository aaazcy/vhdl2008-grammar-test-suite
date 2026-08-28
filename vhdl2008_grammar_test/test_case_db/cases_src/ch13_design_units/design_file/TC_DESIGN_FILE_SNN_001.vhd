-- =============================================================
-- Case ID: TC_DESIGN_FILE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_FILE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Negative
-- Test Focus: invalid design_file - architecture body without preceding entity: architecture rtl of bad_ent is ... but bad_ent was not declared beforehand — architecture_body as a secondary_unit must be another design_unit following an entity; appearing alone it is not a valid design_file
-- Expected Result: Triggers syntax error: architecture requires a preceding entity declaration
-- Dependencies: None
-- =============================================================

-- ERROR: standalone architecture without entity
architecture rtl of df_bad_ent is
  signal s : bit := '0';
begin
  s <= not s;
end architecture rtl;
