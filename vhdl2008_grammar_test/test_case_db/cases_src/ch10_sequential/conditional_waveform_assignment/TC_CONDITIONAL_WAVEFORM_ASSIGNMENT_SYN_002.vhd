-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: Multi-branch conditional waveform assignment with inertial delay: target s_out selects via a 3-branch when-else, each branch includes inertial after 3ns, verifying the delay_mechanism and multi-condition waveforms of conditional_waveform_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cwa_syn2_ent is port(sel:in integer range 0 to 2; din:in integer; y:out integer); end entity;
architecture assign of cwa_syn2_ent is
  signal s_out:integer:=0;
begin
  process(sel,din) begin
    s_out <= din*4 after 3 ns when sel = 0 else
             din*2 after 3 ns when sel = 1 else
             din   after 3 ns;
    y <= s_out;
  end process;
end architecture assign;
