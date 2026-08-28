-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Test Focus: two independent library_clauses each with a use_clause: library std; use std.standard.all; library ieee; use ieee.numeric_std.all; — two library_clause+use_clause pairs, verifying multiple library_clauses in the context_clause each act as an independent context_item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library std;
use std.standard.all;
library ieee;
use ieee.numeric_std.all;

entity lc_two_pairs is
  port (
    din  : in  unsigned(7 downto 0);
    flag : out boolean
  );
end entity lc_two_pairs;

architecture rtl of lc_two_pairs is
begin
  flag <= (din > 127);
end architecture rtl;
