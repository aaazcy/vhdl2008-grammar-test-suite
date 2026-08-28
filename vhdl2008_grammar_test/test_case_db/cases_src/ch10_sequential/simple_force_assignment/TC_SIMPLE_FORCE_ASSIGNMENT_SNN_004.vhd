-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Negative
-- Test Focus: Using wrong assignment operator `=>` instead of `<=` in a force assignment statement
-- Expected Result: Triggers syntax error: invalid assignment operator
-- Dependencies: None
-- =============================================================
entity simple_force_snn_004 is
end entity simple_force_snn_004;

architecture test of simple_force_snn_004 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad => force in '1';  -- ERROR: '=>' instead of '<='
    wait;
  end process;
end architecture test;
