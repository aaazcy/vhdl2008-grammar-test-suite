-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: Conditional waveform assignment in a priority encoder: 5-level when-else priority chain + inertial after 2ns, each level outputs a different scaled value according to the priority of en(i), verifying the application of conditional_waveform_assignment in a real priority decoder
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cwa_syn4_ent is port(en:in bit_vector(4 downto 0); din:in integer; y:out integer); end entity;
architecture assign of cwa_syn4_ent is
  signal s_enc:integer:=0;
begin
  process(en,din) begin
    s_enc <= din*16 after 2 ns when en(4) = '1' else
             din*8  after 2 ns when en(3) = '1' else
             din*4  after 2 ns when en(2) = '1' else
             din*2  after 2 ns when en(1) = '1' else
             din    after 2 ns when en(0) = '1' else
             0      after 2 ns;
    y <= s_enc;
  end process;
end architecture assign;
