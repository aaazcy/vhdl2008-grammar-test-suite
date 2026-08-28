-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_ITEM
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Negative
-- Test Focus: invalid context_item - use_clause missing the "use" keyword: ieee.std_logic_1164.all; — only the library/package path and the .all suffix remain, the use keyword is missing, so it is not a legal use_clause (none of the three context_item alternatives)
-- Expected Result: Triggers syntax error: missing "use" keyword in use_clause
-- Dependencies: None
-- =============================================================
library ieee;
ieee.std_logic_1164.all;

entity ci_no_use_kw is
  port (
    a : in  bit;
    y : out bit
  );
end entity ci_no_use_kw;

architecture rtl of ci_no_use_kw is
begin
  y <= a;
end architecture rtl;
