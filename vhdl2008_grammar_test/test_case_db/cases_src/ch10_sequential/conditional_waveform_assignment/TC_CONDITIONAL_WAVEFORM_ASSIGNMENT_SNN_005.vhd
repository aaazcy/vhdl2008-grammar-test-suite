-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: conditional_waveform_assignment missing the target - in <= 100 when a > b else 0 there is no target signal on the left of <=, the target is completely missing
-- Expected Result: Triggers syntax error: 'end' is expected instead of '<='
-- Dependencies: None
-- =============================================================
entity cwa_missing_target is port(a,b:in integer; y:out integer); end entity;
architecture vhdl2008 of cwa_missing_target is
begin
  process(a,b) begin
    <= 100 when a > b else 0;
    y <= 0;
  end process;
end architecture vhdl2008;
