-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Minimal simple_waveform_assignment: target signal <= expression without delay_mechanism, the simplest form of the production
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity swa_min_ent is port(data:in integer; y:out integer); end entity;
architecture assign of swa_min_ent is
  signal s_reg : integer;
begin
  s_reg <= data;
  y <= s_reg;
end architecture assign;
