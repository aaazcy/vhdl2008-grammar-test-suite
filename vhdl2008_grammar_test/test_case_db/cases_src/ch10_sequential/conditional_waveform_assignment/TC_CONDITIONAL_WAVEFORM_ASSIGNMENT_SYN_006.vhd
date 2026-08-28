-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: Indexed slice target with conditional waveform, exercising slice name as target in conditional_waveform_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cwa_slice_ent is port(sel:in bit; data:in bit_vector(15 downto 0); y:out bit_vector(3 downto 0)); end entity;
architecture assign of cwa_slice_ent is
  signal s_buf : bit_vector(15 downto 0);
begin
  s_buf(3 downto 0) <= data(11 downto 8) when sel = '1' else data(3 downto 0);
  y <= s_buf(3 downto 0);
end architecture assign;
