-- =============================================================
-- Case ID: TC_SELECTED_SIGNAL_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_signal_assignment ::= selected_waveform_assignment | selected_force_assignment
-- Case Type: Positive
-- Test Focus: Selected signal assignment with label + transport delay: label "l_sel" + target s_alu + 4-branch with-select + transport delay, verifying the combination of label, transport delay_mechanism and multiple waveforms in selected_signal_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssa_syn4_ent is port(op:in integer range 0 to 3; a,b:in integer; y:out integer); end entity;
architecture bh of ssa_syn4_ent is
  signal s_alu:integer:=0;
begin
  process(op,a,b) begin
    l_sel: with op select s_alu <=
      transport a + b after 1 ns when 0,
      a - b after 1 ns when 1,
      a * b after 1 ns when 2,
      0     after 1 ns when 3;
    y <= s_alu;
  end process;
end architecture bh;
