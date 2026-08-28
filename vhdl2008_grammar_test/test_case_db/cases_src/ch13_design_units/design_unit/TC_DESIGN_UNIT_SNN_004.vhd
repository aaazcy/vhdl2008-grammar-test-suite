-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Negative
-- Test Focus: invalid design_unit - context_clause only with no library_unit: library ieee; use ieee.std_logic_1164.all; — the file starts with a context_clause but has no following library_unit such as entity/architecture/configuration/package; a context_clause alone cannot form a design_unit
-- Expected Result: Triggers syntax error: context_clause without subsequent library_unit
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
