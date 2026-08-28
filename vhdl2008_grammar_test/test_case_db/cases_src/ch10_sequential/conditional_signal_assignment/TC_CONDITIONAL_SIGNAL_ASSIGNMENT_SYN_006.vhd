-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_signal_assignment ::= conditional_waveform_assignment | conditional_force_assignment
-- Case Type: Positive
-- Test Focus: Conditional signal assignment as a tri-state gate selector: includes label "l_tri", target s_out selects different data paths (pass-through, inversion, high-impedance simulation) via when-else based on the enable and dir signals, verifying the when-else chain and transport delay of conditional_signal_assignment in complex tri-state logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn6_ent is port(en:in bit; dir:in bit; din:in integer; y:out integer); end entity;
architecture bh of csa_syn6_ent is
  signal s_out:integer:=0;
begin
  process(en,dir,din) begin
    l_tri: s_out <= transport din after 1 ns when en = '1' and dir = '0' else
                    -din after 1 ns when en = '1' and dir = '1' else
                    0 after 1 ns;
    y <= s_out;
  end process;
end architecture bh;
