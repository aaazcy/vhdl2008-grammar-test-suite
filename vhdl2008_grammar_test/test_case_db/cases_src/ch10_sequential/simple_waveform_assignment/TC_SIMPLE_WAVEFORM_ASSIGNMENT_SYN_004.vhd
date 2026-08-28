-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Labeled waveform assignment with two waveform elements (value1 after T1, value2 after T2), exercising label + multi-element waveform
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity swa_lbl2elem_ent is port(data:in integer; y:out integer); end entity;
architecture assign of swa_lbl2elem_ent is
  signal s_staged : integer;
begin
  lbl_stage: s_staged <= data after 2 ns, 0 after 10 ns;
  y <= s_staged;
end architecture assign;
