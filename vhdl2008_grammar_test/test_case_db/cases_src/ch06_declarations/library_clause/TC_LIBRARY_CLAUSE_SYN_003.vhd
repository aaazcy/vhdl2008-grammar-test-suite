-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Test Focus: Single library declaration (ieee) with matching use clause; entity uses std_logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity lib_clause_syn003 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity lib_clause_syn003;

architecture bh of lib_clause_syn003 is
  signal s : std_logic := '0';
begin
  s <= a;
  y <= s;
end architecture bh;
