-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Rule Description: All waveform values in a conditional waveform must be type-compatible with the target
-- Case Type: Negative
-- Test Focus: Type mismatch — assigning a std_logic_vector value to an integer target signal
-- Expected Result: Triggers semantic error: type mismatch in waveform
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_smn_002 is
end entity cond_wave_smn_002;

architecture test of cond_wave_smn_002 is
  signal s_bad : integer := 0;
  signal s_en  : boolean := true;
begin
  process(s_en) is
  begin
    s_bad <= X"FF" when s_en else 0;  -- ERROR: hex literal incompatible with integer
  end process;
end architecture test;
