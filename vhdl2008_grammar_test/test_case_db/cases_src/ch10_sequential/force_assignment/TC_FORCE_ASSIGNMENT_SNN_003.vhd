-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing the terminating semicolon in a force assignment -- tests that parser demands `;` at end of force statement
-- Expected Result: Triggers syntax error: missing ';'
-- Dependencies: None
-- =============================================================
entity force_asgn_snn_003 is
end entity force_asgn_snn_003;

architecture test of force_asgn_snn_003 is
  signal s_data : integer := 0;
begin
  process is
  begin
    s_data <= force 42  -- ERROR: missing ';'
    wait;
  end process;
end architecture test;
