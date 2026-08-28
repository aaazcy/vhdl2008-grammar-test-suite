-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Negative
-- Test Focus: Missing the terminating semicolon after `release` in a release assignment
-- Expected Result: Triggers syntax error: missing semicolon
-- Dependencies: None
-- =============================================================
entity simple_release_snn_002 is
end entity simple_release_snn_002;

architecture test of simple_release_snn_002 is
  signal s_bad : integer := 0;
begin
  process is
  begin
    s_bad <= force 5;
    wait for 5 ns;
    s_bad <= release       -- ERROR: missing ';' at end
    wait;
  end process;
end architecture test;
