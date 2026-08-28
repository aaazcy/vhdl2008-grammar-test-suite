-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Negative
-- Test Focus: SNN: library name missing in use_clause — in use .std_logic_1164.all there is no library name before the dot; the selected_name of a use_clause must start with an identifier
-- Expected Result: Triggers syntax error: an identifier is expected instead of '.'
-- Dependencies: None
-- =============================================================
use .std_logic_1164.all;

entity du_missing_lib_name is
  port (
    y : out bit
  );
end entity du_missing_lib_name;

architecture vhdl2008 of du_missing_lib_name is
begin
  y <= '0';
end architecture vhdl2008;
