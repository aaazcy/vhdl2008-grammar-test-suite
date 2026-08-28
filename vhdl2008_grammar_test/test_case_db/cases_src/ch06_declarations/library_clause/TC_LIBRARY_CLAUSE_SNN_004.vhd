-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Test Focus: Missing semicolon after library clause -- violates BNF terminal ';'
-- Expected Result: Triggers syntax error: ';' expected after logical_name_list
-- Dependencies: None
-- =============================================================
library ieee
use ieee.std_logic_1164.all;

entity lib_clause_e004 is
  port (
    a : in  bit;
    y : out bit
  );
end entity lib_clause_e004;

architecture bh of lib_clause_e004 is
begin
  y <= a;
end architecture bh;
