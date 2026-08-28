-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Test Focus: Exercises library_clause with multiple library names in a single logical_name_list.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee, std, work;
use ieee.std_logic_1164.all;

entity library_clause_syn4 is
  port (
    a : in  bit;
    b : out bit
  );
end entity library_clause_syn4;

architecture rtl of library_clause_syn4 is
begin
  b <= not a;
end architecture rtl;
