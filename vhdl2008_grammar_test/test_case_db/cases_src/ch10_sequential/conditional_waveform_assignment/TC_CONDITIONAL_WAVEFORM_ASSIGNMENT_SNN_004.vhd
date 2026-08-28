-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: missing terminating semicolon - `s_res <= 100 when a>b else 0` has no `;` after the complete assignment and is directly followed by `y <= s_res;`, verifying conditional_waveform_assignment requires semicolon termination
-- Expected Result: Triggers syntax error: missing ";" after conditional waveform assignment
-- Dependencies: None
-- =============================================================
entity cwa_snn4_ent is port(a,b:in integer; y:out integer); end entity;
architecture assign of cwa_snn4_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res <= 100 when a > b else 0
    y <= s_res;
  end process;
end architecture assign;
