-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Negative
-- Test Focus: SNN library_clause missing semicolon: library ieee (no ;) use ieee.std_logic_1164.all; — the library_clause in context_clause lacks the required semicolon terminator, verifying the parser detects the context_item format error
-- Expected Result: Triggers syntax error: missing ";" after library clause
-- Dependencies: None
-- =============================================================
library ieee
use ieee.std_logic_1164.all;

entity cc_lib_no_semi is
  port (
    y : out bit
  );
end entity cc_lib_no_semi;

architecture rtl of cc_lib_no_semi is
begin
  y <= '0';
end architecture rtl;
