-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Waveform assignment with 3-element waveform (value1 after T1, value2 after T2, value3 after T3) simulating multi-step signal transition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity swa_3elem_ent is port(trigger:in bit; y:out integer); end entity;
architecture assign of swa_3elem_ent is
  signal s_seq : integer := 0;
begin
  s_seq <= 1 after 1 ns, 2 after 3 ns, 3 after 5 ns;
  y <= s_seq;
end architecture assign;
