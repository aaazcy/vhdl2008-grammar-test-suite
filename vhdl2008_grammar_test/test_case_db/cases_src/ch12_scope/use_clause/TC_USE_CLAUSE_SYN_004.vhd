-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: selected_name using the .all wildcard to import the whole package: use ieee.std_logic_1164.all — verifies that a selected_name with the .all suffix in a use_clause makes all declarations in the package visible
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
entity uc_all_wildcard is
  port (
    a : in  bit;
    b : in  bit;
    y : out bit
  );
end entity uc_all_wildcard;

architecture rtl of uc_all_wildcard is
  use ieee.std_logic_1164.all;
  signal s_and : std_logic;
  signal s_or  : std_logic;
  signal a_sl  : std_logic;
  signal b_sl  : std_logic;
begin
  a_sl <= to_stdulogic(a);
  b_sl <= to_stdulogic(b);
  s_and <= a_sl and b_sl;
  s_or  <= a_sl or b_sl;
  y <= to_bit(s_and xor s_or);
end architecture rtl;
