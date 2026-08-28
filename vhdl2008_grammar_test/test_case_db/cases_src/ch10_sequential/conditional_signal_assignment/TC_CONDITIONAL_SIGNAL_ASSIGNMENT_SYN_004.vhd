-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_signal_assignment ::= conditional_waveform_assignment | conditional_force_assignment
-- Case Type: Positive
-- Test Focus: Conditional signal assignment with label: label "l_cond" + target s_data + boolean expression condition `en='1'` and non-boolean comparison `val>127`, verifying conditional_signal_assignment with a label and compound boolean conditions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn4_ent is port(en:in bit; val:in integer; y:out integer); end entity;
architecture bh of csa_syn4_ent is
  signal s_data:integer:=0;
begin
  process(en,val) begin
    l_cond: s_data <= val after 1 ns when en = '1' and val > 127 else
                      val/2 after 1 ns when en = '1' else
                      0;
    y <= s_data;
  end process;
end architecture bh;
