-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_signal_assignment ::= simple_waveform_assignment | simple_force_assignment | simple_release_assignment
-- Case Type: Positive
-- Test Focus: Minimal form of simple signal assignment: target s_res directly assigned a, no label no delay, verifying the minimal simple_waveform_assignment branch of simple_signal_assignment — only target <= value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sisa_syn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sisa_syn1_ent is
  signal s_res:integer:=0;
begin
  process(a) begin
    s_res <= a;
    y <= s_res;
  end process;
end architecture bh;
