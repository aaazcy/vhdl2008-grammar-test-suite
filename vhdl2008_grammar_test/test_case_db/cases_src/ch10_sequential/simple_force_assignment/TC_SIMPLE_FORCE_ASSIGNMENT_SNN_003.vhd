-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Negative
-- Test Focus: Missing the terminating semicolon after the expression in a force assignment
-- Expected Result: Triggers syntax error: missing semicolon
-- Dependencies: None
-- =============================================================
entity simple_force_snn_003 is
end entity simple_force_snn_003;

architecture test of simple_force_snn_003 is
  signal s_bad : integer := 0;
begin
  process is
  begin
    s_bad <= force in 99    -- ERROR: missing ';' at end
    wait;
  end process;
end architecture test;
