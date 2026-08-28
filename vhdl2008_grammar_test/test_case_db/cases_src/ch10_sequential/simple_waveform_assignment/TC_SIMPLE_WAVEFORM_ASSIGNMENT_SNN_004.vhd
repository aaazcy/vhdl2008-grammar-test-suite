-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: Invalid delay_mechanism syntax — `after` keyword used without preceding time value, breaking the waveform_element grammar
-- Expected Result: Triggers syntax error: invalid delay_mechanism / unexpected `after`
-- Dependencies: None
-- =============================================================
entity swa_baddelay_ent is port(data:in integer; y:out integer); end entity;
architecture assign of swa_baddelay_ent is
  signal s_reg : integer;
begin
  s_reg <= after 5 ns data;
  y <= s_reg;
end architecture assign;
