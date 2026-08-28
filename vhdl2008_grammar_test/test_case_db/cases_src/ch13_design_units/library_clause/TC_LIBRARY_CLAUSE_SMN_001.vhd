-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_LIBRARY_CLAUSE_NONEXISTENT
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Rule Description: libraries declared in a library_clause must actually exist in the VHDL environment
-- Error Category: name resolution error - library does not exist
-- Test Focus: library_clause references a nonexistent library: library phantom_lib; — library_clause declares a library name that does not exist in the VHDL environment, verifying the semantic analyzer detects the library-does-not-exist error
-- Expected Result: Triggers semantic error: library "phantom_lib" not found in VHDL environment
-- Dependencies: None
-- =============================================================
library phantom_lib;

entity lc_bad_lib is
  port (
    y : out bit
  );
end entity lc_bad_lib;

architecture rtl of lc_bad_lib is
begin
  y <= '0';
end architecture rtl;
