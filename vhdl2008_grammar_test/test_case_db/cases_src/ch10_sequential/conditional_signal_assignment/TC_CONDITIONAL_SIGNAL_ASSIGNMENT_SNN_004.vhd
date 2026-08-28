-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_signal_assignment ::= conditional_waveform_assignment | conditional_force_assignment
-- Case Type: Negative
-- Test Focus: SNN: missing terminating semicolon - `s_res <= 100 when a>b else 0` lacks `;` after the complete assignment expression and is directly followed by `y <= s_res;`, verifying conditional_signal_assignment requires semicolon termination
-- Expected Result: Triggers syntax error: missing ";" after conditional signal assignment
-- Dependencies: None
-- =============================================================
entity csa_snn4_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of csa_snn4_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res <= 100 when a > b else 0
    y <= s_res;
  end process;
end architecture bh;
