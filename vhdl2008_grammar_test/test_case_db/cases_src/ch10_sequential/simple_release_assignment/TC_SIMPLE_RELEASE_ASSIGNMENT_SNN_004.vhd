-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Negative
-- Test Focus: Missing the target signal on the left-hand side of the release assignment
-- Expected Result: Triggers syntax error: missing target
-- Dependencies: None
-- =============================================================
entity simple_release_snn_004 is
end entity simple_release_snn_004;

architecture test of simple_release_snn_004 is
begin
  process is
  begin
    <= release;              -- ERROR: missing target before '<='
    wait;
  end process;
end architecture test;
