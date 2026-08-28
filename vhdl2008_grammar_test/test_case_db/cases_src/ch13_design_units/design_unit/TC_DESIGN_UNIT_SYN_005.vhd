-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Positive
-- Test Focus: context_clause with use_clause only + architecture secondary_unit: use ieee.std_logic_1164.all; the architecture uses only std_ulogic — verifying the context_clause may contain only use without library (library ieee is predeclared), and the library_unit may be a secondary_unit (architecture_body)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
entity du_arch_only is
end entity du_arch_only;

library ieee;
use ieee.std_logic_1164.all;

architecture rtl of du_arch_only is
  signal s_val : std_ulogic := '0';
begin
  s_val <= not s_val after 10 ns;
end architecture rtl;
