-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_simple_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: With inertial delay——`y <= a after 5 ns;` the default inertial delay model, verifying that a waveform can specify an after time expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity css_inertial_ent is
  port(a : in bit; y : out bit);
end entity css_inertial_ent;
architecture bh of css_inertial_ent is
begin
  y <= a after 5 ns;
end architecture bh;
