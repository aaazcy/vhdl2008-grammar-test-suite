-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Waveform assignment with transport delay_mechanism, exercising the `transport` keyword preceding `after` clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity swa_transport_ent is port(data:in integer; y:out integer); end entity;
architecture assign of swa_transport_ent is
  signal s_wire : integer;
begin
  s_wire <= transport data after 5 ns;
  y <= s_wire;
end architecture assign;
