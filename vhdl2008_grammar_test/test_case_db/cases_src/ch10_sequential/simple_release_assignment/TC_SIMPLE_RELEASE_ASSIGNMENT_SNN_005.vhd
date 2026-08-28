-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Negative
-- Test Focus: Invalid force_mode keyword `output` used instead of `out` in a release statement
-- Expected Result: Triggers syntax error: invalid force_mode
-- Dependencies: None
-- =============================================================
entity simple_release_snn_005 is
end entity simple_release_snn_005;

architecture test of simple_release_snn_005 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad <= release output; -- ERROR: 'output' not a valid force_mode
    wait;
  end process;
end architecture test;
