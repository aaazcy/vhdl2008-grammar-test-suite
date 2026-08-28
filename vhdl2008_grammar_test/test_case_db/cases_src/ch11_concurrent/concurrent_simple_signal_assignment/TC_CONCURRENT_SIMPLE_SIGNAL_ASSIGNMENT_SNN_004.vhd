-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_simple_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: SNN: target and waveform type mismatch——`y <= '1';` the target y is integer but the waveform is a bit literal, verifying that the waveform type must be compatible with the target
-- Expected Result: Triggers type error: waveform type does not match target signal type
-- Dependencies: None
-- =============================================================
entity css_snn4_ent is
  port(a : in integer; y : out integer);
end entity css_snn4_ent;
architecture bh of css_snn4_ent is
begin
  y <= '1';
end architecture bh;
