-- =============================================================
-- Case ID: TC_WAVEFORM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive
-- Test Focus: Transport delay mechanism with multi-element waveform — the delay_mechanism keyword transport precedes a waveform chain of three elements. Tests waveform with transport delay_mechanism.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_transport_ent is
  port (
    trigger : in  bit;
    pulse   : out bit;
    level   : out integer
  );
end entity wf_transport_ent;

architecture bh of wf_transport_ent is
  signal s_pulse : bit := '0';
begin
  s_pulse <= transport '0' after 2 ns, '1' after 5 ns, '0' after 12 ns;
  pulse   <= s_pulse;
  level   <= transport 0 after 1 ns, 5 after 4 ns, 10 after 8 ns, 15 after 16 ns;
end architecture bh;
