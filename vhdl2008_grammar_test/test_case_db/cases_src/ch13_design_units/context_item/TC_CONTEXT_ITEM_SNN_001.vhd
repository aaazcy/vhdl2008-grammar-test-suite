-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_ITEM
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Negative
-- Test Focus: invalid context_item - library_clause missing semicolon: library ieee (no ;) — library_clause as a context_item must end with a semicolon; the missing semicolon prevents the parser from recognizing the context_item boundary
-- Expected Result: Triggers syntax error: missing ";" after library identifier
-- Dependencies: None
-- =============================================================
library ieee

entity ci_no_semi is
  port (
    y : out bit
  );
end entity ci_no_semi;

architecture rtl of ci_no_semi is
begin
  y <= '0';
end architecture rtl;
