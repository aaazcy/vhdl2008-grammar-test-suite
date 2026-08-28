-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: Conditional waveform assignment with label + transport: label "l_wave" + target s_wave + transport after 1ns + a 4-branch when-else, verifying the label and transport delay combination of conditional_waveform_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cwa_syn3_ent is port(mode:in integer range 0 to 3; val:in integer; y:out integer); end entity;
architecture assign of cwa_syn3_ent is
  signal s_wave:integer:=0;
begin
  process(mode,val) begin
    l_wave: s_wave <= transport val*10 after 1 ns when mode = 0 else
                      val*20 after 1 ns when mode = 1 else
                      val*5  after 1 ns when mode = 2 else
                      0      after 1 ns;
    y <= s_wave;
  end process;
end architecture assign;
