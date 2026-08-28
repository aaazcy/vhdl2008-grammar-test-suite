-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Rule Description: Conditional waveforms are valid in signal assignment within a process
-- Case Type: Positive
-- Test Focus: Valid conditional waveforms with multiple branches and final else in a clocked process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_sem_001 is
end entity cond_wave_sem_001;

architecture test of cond_wave_sem_001 is
  signal s_clk  : std_logic := '0';
  signal s_data : std_logic_vector(7 downto 0) := X"00";
  signal s_sel  : std_logic_vector(1 downto 0) := "00";
begin
  s_clk <= not s_clk after 5 ns;

  process(s_clk) is
  begin
    if rising_edge(s_clk) then
      s_data <= X"FF" when s_sel = "11" else
                X"0F" when s_sel = "10" else
                X"01" when s_sel = "01" else
                X"00";
    end if;
  end process;
end architecture test;
