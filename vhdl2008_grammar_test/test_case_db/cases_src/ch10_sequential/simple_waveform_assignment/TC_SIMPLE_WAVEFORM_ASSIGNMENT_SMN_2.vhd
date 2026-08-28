-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SIMP_WF_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Rule Description: Waveform element types must match target signal type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: Assign character literal '1' to integer signal via simple_waveform_assignment with after clause, triggering type mismatch on waveform element
-- Expected Result: Triggers semantic error: waveform element type mismatch with target
-- Dependencies: None
-- =============================================================
entity swa_type_ent is port(rst:in bit; y:out integer); end entity;
architecture assign of swa_type_ent is
  signal s_targ : integer := 0;
begin
  s_targ <= '1' after 5 ns;
  y <= s_targ;
end architecture assign;
