-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: conditional assignment with a vector target — the 8-bit bus `data_out` selects different input sources according to the mode signal, verifying that a conditional signal assignment supports a vector target
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccsa_vector_ent is
  port(a, b : in bit_vector(7 downto 0); mode_sel : in bit_vector(1 downto 0); data_out : out bit_vector(7 downto 0));
end entity ccsa_vector_ent;
architecture bh of ccsa_vector_ent is
begin
  data_out <= a and b when mode_sel = "00" else
              a or b  when mode_sel = "01" else
              a xor b when mode_sel = "10" else
              not a;
end architecture bh;
