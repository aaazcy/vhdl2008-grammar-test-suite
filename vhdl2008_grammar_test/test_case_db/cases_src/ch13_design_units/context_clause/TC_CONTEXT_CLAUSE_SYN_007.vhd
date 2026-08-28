-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Positive
-- Test Focus: multiple libraries and multiple use clauses: library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all; library std; use std.standard.all; — verifying context_clause contains multiple library_clauses and multiple use_clauses in alternating order
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cc_multi_lib is
  port (
    a : in  std_logic_vector(7 downto 0);
    b : in  std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0)
  );
end entity cc_multi_lib;

architecture rtl of cc_multi_lib is
begin
  y <= std_logic_vector(unsigned(a) + unsigned(b));
end architecture rtl;
