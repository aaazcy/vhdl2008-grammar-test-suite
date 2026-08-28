-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Rule Description: Selected waveform assignment is semantically valid in a process context with after clauses
-- Case Type: Positive
-- Test Focus: Valid selected waveform in process with bit_vector select and transport delay -- tests full selected waveform semantic correctness
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_wave_sem_001 is
end entity sel_wave_sem_001;

architecture test of sel_wave_sem_001 is
  signal s_addr   : bit_vector(1 downto 0) := "00";
  signal s_output : bit_vector(7 downto 0) := "00000000";
begin
  process is
  begin
    with s_addr select s_output <= transport
      "11111111" after 2 ns when "11",
      "00001111" after 2 ns when "10",
      "11110000" after 2 ns when "01",
      "00000000" after 1 ns when others;
    wait for 10 ns;
    wait;
  end process;
end architecture test;
