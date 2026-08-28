-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Negative
-- Test Focus: Using `=>` instead of `<=` as the assignment operator in a release statement
-- Expected Result: Triggers syntax error: invalid assignment operator
-- Dependencies: None
-- =============================================================
entity simple_release_snn_003 is
end entity simple_release_snn_003;

architecture test of simple_release_snn_003 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad => release;       -- ERROR: '=>' instead of '<='
    wait;
  end process;
end architecture test;
