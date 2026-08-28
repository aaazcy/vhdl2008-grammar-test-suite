-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Minimal conditional force with one when/else clause -- tests basic form target <= force expr when cond else expr
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_force_syn_001 is
end entity cond_force_syn_001;

architecture test of cond_force_syn_001 is
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
