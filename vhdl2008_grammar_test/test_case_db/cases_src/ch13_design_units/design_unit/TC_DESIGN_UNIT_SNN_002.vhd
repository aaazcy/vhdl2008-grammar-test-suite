-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SNN_002
-- Rule Type: Syntax
-- BNF Production: design_unit
-- IEEE Section: 13.1
-- BNF Text: design_unit ::= context_clause library_unit
-- Test Focus: Invalid design_unit — context_clause library_clause missing semicolon terminator
-- Case Type: Negative
-- Expected Result: Triggers syntax error: missing ';' after library_clause
-- Dependencies: None
-- =============================================================
-- context_clause with missing terminator
library ieee
-- library_unit
entity tc_design_unit_snn_002 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_design_unit_snn_002;

architecture rtl of tc_design_unit_snn_002 is
begin
  y <= a;
end architecture rtl;
