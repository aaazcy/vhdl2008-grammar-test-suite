-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Test Focus: ERROR: library_clause missing the terminating semicolon.
-- Expected Result: Triggers syntax error (missing semicolon)
-- Dependencies: None
-- =============================================================
library ieee
use ieee.std_logic_1164.all;

entity library_clause_snn3 is
  port (a : in bit; b : out bit);
end entity library_clause_snn3;

architecture arch of library_clause_snn3 is
begin
  b <= not a;
end architecture arch;
