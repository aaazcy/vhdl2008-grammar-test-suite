-- =============================================================
-- Case ID: TC_DESIGN_FILE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_FILE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Negative
-- Test Focus: invalid design_file - library_clause stranded between design_units: library ieee; lacks a following library_unit — library_clause is part of the context_clause and must combine with a library_unit to form a complete design_unit; appearing alone it cannot be a design_unit
-- Expected Result: Triggers syntax error: context_clause without library_unit is not a valid design_unit
-- Dependencies: None
-- =============================================================

entity df5_valid_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity df5_valid_ent;

architecture rtl of df5_valid_ent is
begin
  y <= a;
end architecture rtl;

-- ERROR: context_clause without library_unit
library ieee;
