-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONTEXT_UNKNOWN_LIB
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Negative
-- Rule Description: libraries declared by library_clause in context_clause must exist
-- Error Category: library does not exist - declared library cannot be resolved
-- Test Focus: SMN: library_clause in context_clause declares a nonexistent library — ghost_lib in library ghost_lib is not a compiled library and cannot be resolved during analysis
-- Expected Result: Triggers analysis error: cannot find resource library "ghost_lib"
-- Dependencies: None
-- =============================================================
library ghost_lib;

entity cc_unknown_lib is
  port (
    y : out bit
  );
end entity cc_unknown_lib;

architecture vhdl2008 of cc_unknown_lib is
begin
  y <= '0';
end architecture vhdl2008;
