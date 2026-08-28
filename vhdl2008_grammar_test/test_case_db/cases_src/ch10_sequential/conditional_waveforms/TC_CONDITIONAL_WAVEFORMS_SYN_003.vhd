-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Positive
-- Test Focus: Conditional waveforms with final `else waveform` clause providing default value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_syn_003 is
end entity cond_wave_syn_003;

architecture test of cond_wave_syn_003 is
  signal s_data : std_logic_vector(7 downto 0) := X"00";
  signal s_mode : integer range 0 to 1 := 0;
begin
  process(s_mode) is
  begin
    s_data <= X"FF" when s_mode = 1 else X"00";
  end process;
end architecture test;
