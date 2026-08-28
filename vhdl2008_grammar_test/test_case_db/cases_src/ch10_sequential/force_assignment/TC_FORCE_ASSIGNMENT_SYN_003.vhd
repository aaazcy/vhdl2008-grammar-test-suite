-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Force with one conditional when clause -- tests `force expr when cond` form with single condition branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity force_asgn_syn_003 is
end entity force_asgn_syn_003;

architecture test of force_asgn_syn_003 is
  signal s_data : integer := 0;
  signal s_en   : boolean := true;
begin
  process is
  begin
    s_data <= force 100 when s_en;
    wait for 10 ns;
    s_data <= release;
    wait;
  end process;
end architecture test;
