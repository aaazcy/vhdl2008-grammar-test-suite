-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_LIBRARY_CLAUSE_UNKNOWN
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Rule Description: libraries declared by library_clause must exist
-- Error Category: library does not exist - declared library cannot be resolved
-- Test Focus: SMN: library_clause declares a nonexistent library — ghost_lib in library ghost_lib is not a compiled library and cannot be resolved during analysis
-- Expected Result: Triggers analysis error: cannot find resource library "ghost_lib"
-- Dependencies: None
-- =============================================================
library ghost_lib;

entity lc_unknown_lib is
  port (
    y : out bit
  );
end entity lc_unknown_lib;

architecture vhdl2008 of lc_unknown_lib is
begin
  y <= '0';
end architecture vhdl2008;
