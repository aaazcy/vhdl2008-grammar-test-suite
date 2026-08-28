-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Rule Description: Selected force assignment is valid in process with in mode on an internal signal
-- Case Type: Positive
-- Test Focus: Valid selected force with in mode forcing integer values onto internal signal based on bit_vector select
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_force_sem_001 is
end entity sel_force_sem_001;

architecture test of sel_force_sem_001 is
  signal s_opcode : bit_vector(1 downto 0) := "00";
  signal s_result : integer := 0;
begin
  process is
  begin
    with s_opcode select s_result <= force in
      100 when "00",
      200 when "01",
      300 when "10",
      400 when "11";
    wait for 10 ns;
    s_result <= release in;
    wait;
  end process;
end architecture test;
