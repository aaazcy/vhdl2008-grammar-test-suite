-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Test Focus: library_clause missing semicolon: library ieee (no ;) — library_clause must end with a semicolon; the missing semicolon prevents the parser from recognizing the statement boundary, and the following use_clause is misparsed
-- Expected Result: Triggers syntax error: missing ";" after library clause
-- Dependencies: None
-- =============================================================
library ieee

use ieee.std_logic_1164.all;

entity lc_no_semi is
  port (
    y : out bit
  );
end entity lc_no_semi;

architecture rtl of lc_no_semi is
begin
  y <= '0';
end architecture rtl;
