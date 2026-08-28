-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional force with boolean conditions using relational operators on integer signals
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_force_syn_007 is
end entity cond_force_syn_007;

architecture test of cond_force_syn_007 is
  signal s_out    : integer := 0;
  signal s_level  : integer := 5;
  signal s_thresh : integer := 10;
begin
  process is
  begin
    s_out <= force s_level * 2 when s_level > s_thresh else s_level when s_level >= 0 else 0;
    wait for 10 ns;
    s_out <= release;
    wait;
  end process;
end architecture test;
