-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CWA_ELEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Rule Description: Waveform element count must match target element count when target is composite
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: 2-bit waveform assigned to 4-bit target signal in conditional_waveform_assignment, triggering element count mismatch
-- Expected Result: Triggers semantic error: waveform element count mismatch with target
-- Dependencies: None
-- =============================================================
entity cwa_elemmis_ent is port(sel:in bit; y:out bit_vector(3 downto 0)); end entity;
architecture assign of cwa_elemmis_ent is
  signal s_targ : bit_vector(3 downto 0) := (others => '0');
begin
  s_targ <= "01" when sel = '1' else "0000";
  y <= s_targ;
end architecture assign;
