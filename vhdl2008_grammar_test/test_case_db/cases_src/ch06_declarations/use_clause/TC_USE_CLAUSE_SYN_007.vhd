-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: Exercises use_clause syntax variant 7 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity use_clause_syn7 is
  port (
    a : in  bit;
    b : out bit
  );
end entity use_clause_syn7;

architecture rtl of use_clause_syn7 is
  signal s_val : integer := 7;
begin
  b <= not a;
end architecture rtl;
