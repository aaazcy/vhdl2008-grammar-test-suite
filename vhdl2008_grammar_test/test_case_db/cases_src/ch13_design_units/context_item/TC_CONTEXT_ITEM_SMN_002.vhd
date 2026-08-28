-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONTEXT_ITEM_UNKNOWN_PKG
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Negative
-- Rule Description: packages referenced by use_clause in a context_item must exist in the declared library
-- Error Category: unresolved package
-- Test Focus: SMN: use_clause as a context_item references a nonexistent package — no_such_pkg in use work.no_such_pkg.all does not exist in library work and cannot be resolved during analysis
-- Expected Result: Triggers analysis error: unit "no_such_pkg" not found in library "work"
-- Dependencies: None
-- =============================================================
use work.no_such_pkg.all;

entity ci_unknown_pkg is
  port (
    y : out bit
  );
end entity ci_unknown_pkg;

architecture vhdl2008 of ci_unknown_pkg is
begin
  y <= '0';
end architecture vhdl2008;
