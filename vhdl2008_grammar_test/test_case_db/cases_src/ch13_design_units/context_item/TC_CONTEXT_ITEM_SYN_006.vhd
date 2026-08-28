-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_ITEM
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Positive
-- Test Focus: alternating library_clause+use_clause across libraries: library std; use std.standard.all; library ieee; use ieee.std_logic_1164.all — verifying library_clauses and use_clauses of multiple libraries appear alternately and are parsed correctly as independent context_items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity ci_multi_lib is
  port (
    a : in  std_logic;
    b : in  std_logic;
    y : out std_logic
  );
end entity ci_multi_lib;

architecture rtl of ci_multi_lib is
  signal s_and : std_logic;
begin
  s_and <= a and b;
  y     <= s_and;
end architecture rtl;
