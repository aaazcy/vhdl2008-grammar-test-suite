-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONTEXT_ITEM_UNDECLARED_LIB
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Negative
-- Rule Description: libraries referenced by use_clause as a context_item must be declared via library_clause
-- Error Category: name resolution error - use_clause references an undeclared library
-- Test Focus: use_clause as a context_item references an undeclared library: library ieee; use badlib.some_pkg.all; — the preceding library_clause declares ieee but the use_clause references undeclared library badlib, verifying semantic analysis detects the inconsistent library reference between context_items
-- Expected Result: Triggers semantic error: library "badlib" not declared by any library_clause
-- Dependencies: None
-- =============================================================
library ieee;
use badlib.some_pkg.all;

entity ci_undeclared_lib is
  port (
    y : out bit
  );
end entity ci_undeclared_lib;

architecture rtl of ci_undeclared_lib is
begin
  y <= '0';
end architecture rtl;
