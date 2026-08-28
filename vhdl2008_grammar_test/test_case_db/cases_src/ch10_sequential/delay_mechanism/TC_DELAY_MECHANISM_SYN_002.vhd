-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_DELAY_MECHANISM
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Positive
-- Test Focus: delay_mechanism: transport delay with multiple waveform elements in signal assignment (glitch propagation)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity delay_mech_syn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of delay_mech_syn2_ent is
  signal s_trans:integer:=0;
begin
  s_trans <= transport a after 5 ns, a+1 after 10 ns, a+2 after 15 ns;
  y <= s_trans;
end architecture bh;
