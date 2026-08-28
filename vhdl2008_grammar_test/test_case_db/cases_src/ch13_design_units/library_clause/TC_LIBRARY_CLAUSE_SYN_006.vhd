-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Test Focus: library_clause with comma list + subsequent multiple use_clauses: library ieee, work; use ieee.std_logic_1164.all; use ieee.numeric_std.all; — a single library_clause contains two comma-separated library names, and subsequent use_clauses reference different packages of that library, verifying the comma list and multiple-use combination
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lc_comma_with_use is
  port (
    a    : in  unsigned(3 downto 0);
    b    : in  unsigned(3 downto 0);
    sum  : out unsigned(4 downto 0)
  );
end entity lc_comma_with_use;

architecture rtl of lc_comma_with_use is
begin
  sum <= ('0' & a) + ('0' & b);
end architecture rtl;
