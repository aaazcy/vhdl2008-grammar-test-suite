-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: design_unit
-- IEEE Section: 13.1
-- BNF Text: design_unit ::= context_clause library_unit
-- Test Focus: design_unit with library_clause context items and entity as library_unit
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- context_clause
library ieee;
-- library_unit (primary)
entity tc_design_unit_syn_s01 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_design_unit_syn_s01;

-- library_unit (secondary)
architecture rtl of tc_design_unit_syn_s01 is
begin
  y <= a;
end architecture rtl;
