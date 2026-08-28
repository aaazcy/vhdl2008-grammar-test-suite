-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: Conditional waveform assignment with reject time: target s_filt selects via when-else, each branch waveform contains reject 2ns inertial after 5ns pulse filtering, verifying the reject/inertial pulse rejection delay mechanism of conditional_waveform_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cwa_syn5_ent is port(thresh:in integer; din:in integer; y:out integer); end entity;
architecture assign of cwa_syn5_ent is
  signal s_filt:integer:=0;
begin
  process(thresh,din) begin
    s_filt <= reject 2 ns inertial din after 5 ns when din > thresh else
              0   after 5 ns;
    y <= s_filt;
  end process;
end architecture assign;
