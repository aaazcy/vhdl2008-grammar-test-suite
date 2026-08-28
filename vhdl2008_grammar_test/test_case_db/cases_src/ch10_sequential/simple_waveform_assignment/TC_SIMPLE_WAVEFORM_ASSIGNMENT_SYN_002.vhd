-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Waveform assignment with default inertial delay (after clause without transport/reject), exercising single waveform_element with time
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity swa_inert_ent is port(data:in integer; y:out integer); end entity;
architecture assign of swa_inert_ent is
  signal s_delayed : integer;
begin
  s_delayed <= data after 5 ns;
  y <= s_delayed;
end architecture assign;
