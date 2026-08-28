-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Negative
-- Test Focus: Missing the target signal (left-hand side) in a force assignment, starting directly with `<= force`
-- Expected Result: Triggers syntax error: missing target
-- Dependencies: None
-- =============================================================
entity simple_force_snn_002 is
end entity simple_force_snn_002;

architecture test of simple_force_snn_002 is
begin
  process is
  begin
    <= force '1';            -- ERROR: missing target before '<='
    wait;
  end process;
end architecture test;
