-- =============================================================
-- Case ID: TC_SEM_LIBRARY_CLAUSE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_LIBRARY_CLAUSE_001
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Rule Description: A library clause must reference a design library known to the host environment; referencing a non-existent library is a semantic error
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: library clause references a library name not mapped in the host environment, triggering undefined library error during elaboration
-- Expected Result: Triggers semantic error: undefined design library
-- Dependencies: none
-- =============================================================
library nonexistent_lib_xyz;
use nonexistent_lib_xyz.some_pkg.all;

entity sem_lib_clause_smn001 is
  port (
    a : in  bit;
    y : out bit
  );
end entity sem_lib_clause_smn001;

architecture bh of sem_lib_clause_smn001 is
begin
  y <= a;
end architecture bh;
