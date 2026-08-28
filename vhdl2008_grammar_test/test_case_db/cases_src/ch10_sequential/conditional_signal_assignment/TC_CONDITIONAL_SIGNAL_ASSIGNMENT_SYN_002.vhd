-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_signal_assignment ::= conditional_waveform_assignment | conditional_force_assignment
-- Case Type: Positive
-- Test Focus: Minimal form of conditional signal assignment: target s_res selects a value via a two-branch when-else, condition is a > b, verifying the basic when-else syntax of conditional_signal_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn2_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of csa_syn2_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res <= 100 when a > b else 0;
    y <= s_res;
  end process;
end architecture bh;
