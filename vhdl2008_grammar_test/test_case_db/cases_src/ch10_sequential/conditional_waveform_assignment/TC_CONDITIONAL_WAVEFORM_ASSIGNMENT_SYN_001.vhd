-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: Minimal form of conditional waveform assignment: target s_res selects a waveform value via a 2-branch when-else, verifying the minimal when-else syntax of conditional_waveform_assignment (no delay)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cwa_syn1_ent is port(a,b:in integer; y:out integer); end entity;
architecture assign of cwa_syn1_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res <= 100 when a > b else 0;
    y <= s_res;
  end process;
end architecture assign;
