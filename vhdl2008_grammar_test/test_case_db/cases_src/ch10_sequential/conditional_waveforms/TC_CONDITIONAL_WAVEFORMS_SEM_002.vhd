-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Rule Description: Final else waveform provides a catch-all value; valid semantic construct
-- Case Type: Positive
-- Test Focus: Conditional waveforms with final else providing default for all unmatched conditions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_sem_002 is
end entity cond_wave_sem_002;

architecture test of cond_wave_sem_002 is
  signal s_out : std_logic_vector(3 downto 0) := "0000";
  signal s_cmd : std_logic_vector(1 downto 0) := "00";
begin
  process(s_cmd) is
  begin
    s_out <= "1111" when s_cmd = "11" else
             "0011" when s_cmd = "10" else
             "0000";
  end process;
end architecture test;
