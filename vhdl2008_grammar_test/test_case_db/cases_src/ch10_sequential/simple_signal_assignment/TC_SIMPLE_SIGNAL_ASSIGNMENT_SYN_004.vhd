-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_signal_assignment ::= simple_waveform_assignment | simple_force_assignment | simple_release_assignment
-- Case Type: Positive
-- Test Focus: Simple signal assignment with multi-element waveform: target s_wave assigned a 2-element waveform `1 after 2ns, 2 after 5ns`, verifying the multi-element list form of the waveform of simple_signal_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sisa_syn4_ent is port(trig:in bit; y:out integer); end entity;
architecture bh of sisa_syn4_ent is
  signal s_wave:integer:=0;
begin
  process(trig) begin
    if trig = '1' then
      s_wave <= 1 after 2 ns, 2 after 5 ns, 3 after 8 ns;
    end if;
    y <= s_wave;
  end process;
end architecture bh;
