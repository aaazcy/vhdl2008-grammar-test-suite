-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: missing `when` - `s_res <= 100 a>b else 0;` attaches the condition directly after the waveform, skipping the when keyword, verifying conditional_waveform_assignment requires the when keyword
-- Expected Result: Triggers syntax error: missing "when" in conditional waveform assignment
-- Dependencies: None
-- =============================================================
entity cwa_snn2_ent is port(a,b:in integer; y:out integer); end entity;
architecture assign of cwa_snn2_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res <= 100 a > b else 0;
    y <= s_res;
  end process;
end architecture assign;
