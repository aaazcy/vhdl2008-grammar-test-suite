-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: Conditional waveform with reject time in delay_mechanism, exercising the VHDL 2008 `reject` keyword within conditional_waveform_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cwa_reject_ent is port(sel:in bit; val:in integer; y:out integer); end entity;
architecture assign of cwa_reject_ent is
  signal s_out : integer;
begin
  s_out <= reject 2 ns inertial val after 10 ns when sel = '1' else 0;
  y <= s_out;
end architecture assign;
