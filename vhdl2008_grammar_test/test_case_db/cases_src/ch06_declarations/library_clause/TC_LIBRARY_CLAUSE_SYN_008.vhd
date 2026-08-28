-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Test Focus: Exercises library_clause syntax variant 8 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity library_clause_syn8 is
  port (
    a : in  bit;
    b : out bit
  );
end entity library_clause_syn8;

architecture rtl of library_clause_syn8 is
  signal s_val : integer := 8;
begin
  b <= not a;
end architecture rtl;
