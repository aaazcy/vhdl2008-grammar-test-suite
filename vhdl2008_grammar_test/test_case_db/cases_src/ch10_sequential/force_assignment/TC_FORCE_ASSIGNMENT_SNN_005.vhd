-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Invalid force_mode -- `force input` is not a valid force_mode (only `in` or `out` are allowed)
-- Expected Result: Triggers syntax error: invalid force_mode 'input'
-- Dependencies: None
-- =============================================================
entity force_asgn_snn_005 is
end entity force_asgn_snn_005;

architecture test of force_asgn_snn_005 is
  signal s_data : integer := 0;
begin
  process is
  begin
    s_data <= force input 42;  -- ERROR: 'input' is not valid force_mode
    wait;
  end process;
end architecture test;
