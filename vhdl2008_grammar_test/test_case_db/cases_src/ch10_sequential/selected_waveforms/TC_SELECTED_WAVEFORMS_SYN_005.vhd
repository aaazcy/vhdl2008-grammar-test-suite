-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Positive
-- Test Focus: Selected waveforms using `unaffected` keyword as a waveform for specific choices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_005 is
end entity sel_wave_syn_005;

architecture test of sel_wave_syn_005 is
  type t_state is (RUN, HALT, RESET);
  signal s_data : std_logic_vector(3 downto 0) := "0000";
  signal s_state : t_state := RESET;
begin
  process(s_state) is
  begin
    with s_state select
      s_data <= "1111" when RUN,
                unaffected when HALT,
                "0000" when RESET;
  end process;
end architecture test;
