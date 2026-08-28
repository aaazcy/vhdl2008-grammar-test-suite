-- =============================================================
-- Case ID: TC_WAVEFORM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive
-- Test Focus: reject + inertial delay mechanism with waveform chain — the delay_mechanism reject time_expression inertial precedes a waveform of three elements. Tests the full delay_mechanism + waveform combination.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_reject_ent is
  port (
    a_in   : in  integer;
    b_out  : out integer;
    toggle : out bit
  );
end entity wf_reject_ent;

architecture bh of wf_reject_ent is
  signal s_val : integer := 0;
begin
  -- reject + inertial with waveform chain
  s_val  <= reject 2 ns inertial a_in after 3 ns, a_in * 2 after 8 ns, a_in * 3 after 15 ns;
  b_out  <= s_val;
  toggle <= reject 500 ps inertial '0' after 1 ns, '1' after 3 ns;
end architecture bh;
