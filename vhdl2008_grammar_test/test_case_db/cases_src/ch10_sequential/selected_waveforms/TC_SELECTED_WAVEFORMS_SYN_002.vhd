-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Positive
-- Test Focus: Selected waveforms with two waveform alternatives for an enumerated type select expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_002 is
end entity sel_wave_syn_002;

architecture test of sel_wave_syn_002 is
  type t_op is (READ, WRITE, IDLE);
  signal s_data : std_logic_vector(7 downto 0) := X"00";
  signal s_op   : t_op := IDLE;
begin
  process(s_op) is
  begin
    with s_op select
      s_data <= X"AB" when READ,
                X"CD" when WRITE,
                X"00" when IDLE;
  end process;
end architecture test;
