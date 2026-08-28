-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Negative
-- Test Focus: SNN use_clause missing "use" keyword: ieee.std_logic_1164.all; — the use_clause in context_clause lacks the required use keyword, leaving only the package path and semicolon, verifying the parser detects the incomplete use_clause format
-- Expected Result: Triggers syntax error: missing "use" keyword in use_clause
-- Dependencies: None
-- =============================================================
library ieee;
ieee.std_logic_1164.all;

entity cc_no_use_kw is
  port (
    y : out bit
  );
end entity cc_no_use_kw;

architecture rtl of cc_no_use_kw is
begin
  y <= '0';
end architecture rtl;
