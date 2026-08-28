-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: Exercises use_clause importing specific named items rather than .all wildcards.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.std_ulogic;
use ieee.std_logic_1164.rising_edge;

entity use_clause_syn4 is
  port (
    a : in  bit;
    b : out bit
  );
end entity use_clause_syn4;

architecture rtl of use_clause_syn4 is
begin
  b <= not a;
end architecture rtl;
