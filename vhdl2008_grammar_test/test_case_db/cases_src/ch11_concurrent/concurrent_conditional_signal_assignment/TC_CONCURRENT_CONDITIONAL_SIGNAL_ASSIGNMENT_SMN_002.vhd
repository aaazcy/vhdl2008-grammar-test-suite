-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Rule Description: Waveform elements in conditional signal assignments must match the target type; each waveform alternative must be of the same base type as the target
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: waveform type does not match the target — the target `y` is bit_vector(3 downto 0) but the waveform `1` is an integer literal, verifying that the waveform type of each branch of a conditional assignment must agree with the target
-- Expected Result: Triggers type error: waveform does not match target type
-- Dependencies: None
-- =============================================================
entity ccsa_smn2_ent is
  port(sel : in bit; y : out bit_vector(3 downto 0));
end entity ccsa_smn2_ent;
architecture bh of ccsa_smn2_ent is
begin
  y <= "0000" when sel = '1' else 1;
end architecture bh;
