-- =============================================================
-- Case ID: TC_SELECTED_SIGNAL_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_signal_assignment ::= selected_waveform_assignment | selected_force_assignment
-- Case Type: Positive
-- Test Focus: Selected signal assignment with delay: target s_out selects 4 different values via with-select, each branch has an inertial delay of 2 ns, verifying the combination of delay_mechanism and selected_waveforms in selected_signal_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssa_syn3_ent is port(sel:in integer range 0 to 3; din:in integer; y:out integer); end entity;
architecture bh of ssa_syn3_ent is
  signal s_out:integer:=0;
begin
  process(sel,din) begin
    with sel select s_out <=
      din     after 2 ns when 0,
      din*2   after 2 ns when 1,
      din/2   after 2 ns when 2,
      0       after 2 ns when 3;
    y <= s_out;
  end process;
end architecture bh;
