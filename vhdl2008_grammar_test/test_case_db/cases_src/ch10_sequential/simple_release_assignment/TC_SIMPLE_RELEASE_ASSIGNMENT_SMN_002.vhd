-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_026
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Rule Description: Release target must be a signal; releasing a constant or variable is invalid
-- Case Type: Negative
-- Test Focus: Attempting to release a constant object — constants have no driver to release
-- Expected Result: Triggers semantic error: cannot release a constant
-- Dependencies: None
-- =============================================================
entity simple_release_smn_002 is
end entity simple_release_smn_002;

architecture test of simple_release_smn_002 is
  constant C_VAL : bit := '0';
begin
  process is
  begin
    C_VAL <= release;       -- ERROR: cannot release a constant
    wait;
  end process;
end architecture test;
