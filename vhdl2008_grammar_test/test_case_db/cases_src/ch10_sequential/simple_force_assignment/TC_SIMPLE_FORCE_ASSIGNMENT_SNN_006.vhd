-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Negative
-- Test Focus: Invalid force_mode keyword (using `input` instead of `in`) in a force assignment
-- Expected Result: Triggers syntax error: invalid force_mode
-- Dependencies: None
-- =============================================================
entity simple_force_snn_006 is
end entity simple_force_snn_006;

architecture test of simple_force_snn_006 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad <= force input '1';  -- ERROR: 'input' not a valid force_mode
    wait;
  end process;
end architecture test;
