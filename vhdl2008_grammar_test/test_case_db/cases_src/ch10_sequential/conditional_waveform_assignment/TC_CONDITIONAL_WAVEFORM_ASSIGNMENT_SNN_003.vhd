-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: waveform missing after else - in s_res <= 100 when a > b else ; there is no waveform on the right of else, the else branch of conditional_waveforms must carry a waveform
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity cwa_missing_else_waveform is port(a,b:in integer; y:out integer); end entity;
architecture vhdl2008 of cwa_missing_else_waveform is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res <= 100 when a > b else;
    y <= s_res;
  end process;
end architecture vhdl2008;
