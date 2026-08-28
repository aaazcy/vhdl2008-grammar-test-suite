-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: Missing semicolon terminator in waveform assignment — complete target <= waveform present but terminating semicolon omitted
-- Expected Result: Triggers syntax error: missing terminating semicolon
-- Dependencies: None
-- =============================================================
entity swa_misssemi_ent is port(data:in integer; y:out integer); end entity;
architecture assign of swa_misssemi_ent is
  signal s_reg : integer;
begin
  s_reg <= data after 3 ns
  y <= s_reg;
end architecture assign;
