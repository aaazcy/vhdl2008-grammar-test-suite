-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONTEXT_NONEXISTENT_LIB
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Negative
-- Rule Description: libraries referenced by library_clause in context_clause must exist in the VHDL environment
-- Error Category: name resolution error - library does not exist
-- Test Focus: SMN library references a nonexistent library: library nonexistent_lib; — library_clause declares a nonexistent library name, verifying the semantic analyzer detects the library-does-not-exist error
-- Expected Result: Triggers semantic error: library "nonexistent_lib" not found
-- Dependencies: None
-- =============================================================
library nonexistent_lib;
use nonexistent_lib.some_pkg.all;

entity cc_bad_lib is
  port (
    y : out bit
  );
end entity cc_bad_lib;

architecture rtl of cc_bad_lib is
begin
  y <= '0';
end architecture rtl;
