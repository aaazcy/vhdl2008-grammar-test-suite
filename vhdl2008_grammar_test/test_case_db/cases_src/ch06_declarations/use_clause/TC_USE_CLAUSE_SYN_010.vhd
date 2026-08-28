-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: Exercises use_clause syntax variant 10 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity use_clause_syn10 is
  port (
    a : in  bit;
    b : out bit
  );
end entity use_clause_syn10;

architecture rtl of use_clause_syn10 is
  signal s_val : integer := 10;
begin
  b <= not a;
end architecture rtl;
