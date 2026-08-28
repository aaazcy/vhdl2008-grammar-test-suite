-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: target and waveform types are incompatible — `y <= "1010" when sel='1' else '1';` returns bit_vectors of different lengths in different branches, verifying that the value of each branch of a conditional assignment must be type-compatible with the target
-- Expected Result: Triggers type error: waveform type mismatch with target
-- Dependencies: None
-- =============================================================
entity ccsa_snn5_ent is
  port(sel : in bit; y : out bit_vector(3 downto 0));
end entity ccsa_snn5_ent;
architecture bh of ccsa_snn5_ent is
begin
  y <= "1010" when sel = '1' else '1';
end architecture bh;
