-- =============================================================
-- Case ID: TC_DESIGN_FILE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_FILE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Positive
-- Test Focus: minimal design_file - single design_unit: just one entity+architecture pair forms the smallest shape with { design_unit } repeated zero times, verifying a design_file may consist of a single design_unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Single design_unit
entity df_min_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity df_min_ent;

architecture rtl of df_min_ent is
begin
  y <= a;
end architecture rtl;
