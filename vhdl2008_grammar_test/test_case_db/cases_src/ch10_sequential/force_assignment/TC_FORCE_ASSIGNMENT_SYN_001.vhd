-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Minimal force assignment -- simple form `target <= force expr` with no force_mode and no condition, single bare expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity force_asgn_syn_001 is
end entity force_asgn_syn_001;

architecture test of force_asgn_syn_001 is
  signal s_data : integer := 0;
begin
  process is
  begin
    s_data <= force 42;
    wait for 10 ns;
    s_data <= release;
    wait;
  end process;
end architecture test;
