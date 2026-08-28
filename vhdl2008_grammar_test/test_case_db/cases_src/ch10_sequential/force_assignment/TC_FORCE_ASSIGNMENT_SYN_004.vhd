-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Force with conditional when and else clause -- tests full `force expr when cond else expr` two-branch form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity force_asgn_syn_004 is
end entity force_asgn_syn_004;

architecture test of force_asgn_syn_004 is
  signal s_data : integer := 0;
  signal s_sel  : boolean := true;
begin
  process is
  begin
    s_data <= force 10 when s_sel else 20;
    wait for 10 ns;
    s_data <= release;
    wait;
  end process;
end architecture test;
