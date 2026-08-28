-- =============================================================
-- Case ID: TC_USE_CLAUSE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_USE_NONEXISTENT_PKG
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Rule Description: The package referenced by a use_clause must exist in the specified library
-- Error Category: Name resolution error — package does not exist
-- Test Focus: SMN reference to a nonexistent package: use ieee.nonexistent_pkg.all — the ieee library is declared but nonexistent_pkg does not exist in it, verifying that the semantic analyzer detects the package name resolution failure
-- Expected Result: Triggers semantic error: package "nonexistent_pkg" not found in library "ieee"
-- Dependencies: None
-- =============================================================
library ieee;

entity uc_bad_pkg is
  port (
    y : out bit
  );
end entity uc_bad_pkg;

architecture rtl of uc_bad_pkg is
  -- ERROR: nonexistent_pkg does not exist in library ieee
  use ieee.nonexistent_pkg.all;
  signal s : bit := '0';
begin
  y <= s;
end architecture rtl;
