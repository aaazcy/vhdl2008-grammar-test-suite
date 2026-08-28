-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional force with three condition branches and final else -- tests full chain of when/else
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_force_syn_004 is
end entity cond_force_syn_004;

architecture test of cond_force_syn_004 is
  signal s_val  : integer := 0;
  signal s_sel  : integer range 0 to 3 := 0;
begin
  process is
  begin
    s_val <= force 1 when s_sel = 0 else 2 when s_sel = 1 else 3 when s_sel = 2 else 99;
    wait for 10 ns;
    s_val <= release;
    wait;
  end process;
end architecture test;
