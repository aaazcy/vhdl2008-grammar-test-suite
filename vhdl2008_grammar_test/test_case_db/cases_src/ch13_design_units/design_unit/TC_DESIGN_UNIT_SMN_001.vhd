-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_DESIGN_UNIT_LIB_ORDER
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Negative
-- Rule Description: a use_clause in the context_clause must not appear before the library_clause declaring the corresponding library
-- Error Category: name resolution error - use_clause references an undeclared library
-- Test Focus: use_clause before library_clause: use ieee.std_logic_1164.all; library ieee; — the use_clause as a context_item in the context_clause references library ieee not yet declared via library_clause, verifying semantic analysis detects the undeclared library
-- Expected Result: Triggers semantic error: library "ieee" must be declared before use_clause
-- Dependencies: None
-- =============================================================
use ieee.std_logic_1164.all;
library ieee;

entity du_inv_order is
  port (
    y : out std_ulogic
  );
end entity du_inv_order;

architecture rtl of du_inv_order is
begin
  y <= '0';
end architecture rtl;
