-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: Exercises use_clause with multiple selected_name items importing several package items.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;

entity use_clause_syn3 is
  port (
    a : in  bit;
    b : out bit
  );
end entity use_clause_syn3;

architecture rtl of use_clause_syn3 is
begin
  b <= not a after 1 ns;
end architecture rtl;
