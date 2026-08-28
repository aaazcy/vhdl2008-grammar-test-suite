-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_signal_assignment ::= simple_waveform_assignment | simple_force_assignment | simple_release_assignment
-- Case Type: Positive
-- Test Focus: Simple signal assignment with inertial delay: target s_out assigned din with inertial after 5ns, verifying the delay_mechanism inertial form of simple_signal_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sisa_syn2_ent is port(din:in integer; y:out integer); end entity;
architecture bh of sisa_syn2_ent is
  signal s_out:integer:=0;
begin
  process(din) begin
    s_out <= din after 5 ns;
    y <= s_out;
  end process;
end architecture bh;
