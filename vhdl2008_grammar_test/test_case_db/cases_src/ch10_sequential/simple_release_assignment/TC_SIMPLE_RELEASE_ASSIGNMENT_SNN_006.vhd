-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Negative
-- Test Focus: Trailing expression after release/force_mode — release statement should not have an expression
-- Expected Result: Triggers syntax error: unexpected expression after release
-- Dependencies: None
-- =============================================================
entity simple_release_snn_006 is
end entity simple_release_snn_006;

architecture test of simple_release_snn_006 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad <= release in '1'; -- ERROR: expression after release not allowed
    wait;
  end process;
end architecture test;
