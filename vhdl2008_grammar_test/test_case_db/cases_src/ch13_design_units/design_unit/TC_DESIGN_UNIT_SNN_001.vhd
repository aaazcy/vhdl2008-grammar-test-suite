-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Negative
-- Test Focus: invalid design_unit - library_clause in context_clause missing semicolon: library ieee (no ;) use ieee.std_logic_1164.all; entity — the library statement lacks the required semicolon terminator, making the context_clause malformed so the whole design_unit cannot be parsed
-- Expected Result: Triggers syntax error: missing ";" after library clause in context_clause
-- Dependencies: None
-- =============================================================
library ieee
use ieee.std_logic_1164.all;

entity du_no_semi is
  port (
    y : out bit
  );
end entity du_no_semi;

architecture rtl of du_no_semi is
begin
  y <= '0';
end architecture rtl;
