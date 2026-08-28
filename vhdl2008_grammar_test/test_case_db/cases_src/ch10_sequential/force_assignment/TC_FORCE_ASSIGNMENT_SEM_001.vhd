-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Rule Description: Force assignment with in mode is semantically valid in a process on an internal signal
-- Case Type: Positive
-- Test Focus: Valid force with in mode on integer signal in a process -- tests basic force in semantic correctness
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity force_asgn_sem_001 is
end entity force_asgn_sem_001;

architecture test of force_asgn_sem_001 is
  signal s_count : integer := 0;
begin
  process is
  begin
    s_count <= force in 100;
    wait for 10 ns;
    s_count <= release in;
    wait;
  end process;
end architecture test;
