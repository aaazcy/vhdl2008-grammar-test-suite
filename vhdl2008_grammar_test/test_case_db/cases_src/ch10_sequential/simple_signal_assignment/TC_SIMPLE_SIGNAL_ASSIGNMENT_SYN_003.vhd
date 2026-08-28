-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_signal_assignment ::= simple_waveform_assignment | simple_force_assignment | simple_release_assignment
-- Case Type: Positive
-- Test Focus: Simple signal assignment with label + transport delay: label "l_drv" + target s_drv + transport after 3ns, verifying the combination of label and transport delay_mechanism of simple_signal_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sisa_syn3_ent is port(din:in integer; y:out integer); end entity;
architecture bh of sisa_syn3_ent is
  signal s_drv:integer:=0;
begin
  process(din) begin
    l_drv: s_drv <= transport din after 3 ns;
    y <= s_drv;
  end process;
end architecture bh;
