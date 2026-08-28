-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: missing `<=` - `s_res 100 when a>b else 0;` attaches the waveform directly after the target with no assignment arrow, verifying conditional_waveform_assignment requires the `<=` operator
-- Expected Result: Triggers syntax error: missing "<=" in conditional waveform assignment
-- Dependencies: None
-- =============================================================
entity cwa_snn1_ent is port(a,b:in integer; y:out integer); end entity;
architecture assign of cwa_snn1_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res 100 when a > b else 0;
    y <= s_res;
  end process;
end architecture assign;
