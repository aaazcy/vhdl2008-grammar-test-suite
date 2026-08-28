-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Positive
-- Test Focus: Conditional waveforms with three condition branches and a final else clause — full chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_wave_syn_004 is
end entity cond_wave_syn_004;

architecture test of cond_wave_syn_004 is
  signal s_out  : integer := 0;
  signal s_level : integer range 0 to 3 := 0;
begin
  process(s_level) is
  begin
    s_out <= 100 when s_level = 3 else
             50 when s_level = 2 else
             10 when s_level = 1 else
             0;
  end process;
end architecture test;
