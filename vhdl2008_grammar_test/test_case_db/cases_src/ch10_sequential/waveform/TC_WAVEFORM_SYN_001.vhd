-- =============================================================
-- Case ID: TC_WAVEFORM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive
-- Test Focus: Multi-value waveform chain — three waveform_elements each with after clause, testing comma-separated repetition in a simple signal assignment. Covers the waveform_element { , waveform_element } branch of the BNF.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_multi_ent is
  port (
    sig_in  : in  integer;
    sig_out : out integer;
    flag    : out bit
  );
end entity wf_multi_ent;

architecture bh of wf_multi_ent is
  signal s_wf : integer := 0;
begin
  -- Three-element waveform chain with after clauses
  s_wf    <= sig_in after 5 ns, sig_in + 1 after 10 ns, sig_in + 2 after 15 ns;
  sig_out <= s_wf;
  flag    <= '0' after 1 ns, '1' after 20 ns;
end architecture bh;
