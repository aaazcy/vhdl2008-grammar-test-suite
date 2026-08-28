-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SNN_003
-- Rule Type: Syntax
-- BNF Production: design_unit
-- IEEE Section: 13.1
-- BNF Text: design_unit ::= context_clause library_unit
-- Test Focus: SNN: library_clause in context_clause missing the library name — in library ; the logical_name_list is missing; library_clause must be followed by at least one logical name
-- Case Type: Negative
-- Expected Result: Triggers syntax error: an identifier is expected instead of ';'
-- Dependencies: None
-- =============================================================
library;

entity tc_design_unit_snn_003 is
  port (
    y : out bit
  );
end entity tc_design_unit_snn_003;

architecture vhdl2008 of tc_design_unit_snn_003 is
begin
  y <= '0';
end architecture vhdl2008;
