-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Positive
-- Test Focus: Conditional waveforms with complex boolean conditions using relational and logical operators
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_syn_007 is
end entity cond_wave_syn_007;

architecture test of cond_wave_syn_007 is
  signal s_out  : std_logic_vector(7 downto 0) := X"00";
  signal s_a    : integer := 5;
  signal s_b    : integer := 10;
begin
  process(s_a, s_b) is
  begin
    s_out <= X"FF" when s_a > s_b and s_a > 0 else
             X"0F" when s_a = s_b else
             X"00" when s_a < s_b else
             X"01";
  end process;
end architecture test;
