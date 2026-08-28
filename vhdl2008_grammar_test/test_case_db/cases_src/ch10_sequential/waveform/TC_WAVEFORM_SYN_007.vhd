-- =============================================================
-- Case ID: TC_WAVEFORM_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive
-- Test Focus: Long waveform chain — five waveform_elements in a single signal assignment, mixing those with and without after clauses. Tests deep repetition of the { , waveform_element } pattern.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_long_ent is
  port (
    clk      : out bit;
    phase    : out integer;
    strobe   : out bit
  );
end entity wf_long_ent;

architecture bh of wf_long_ent is
  signal s_osc : bit := '0';
begin
  -- Long five-element waveform chain
  s_osc  <= '0' after 2 ns, '1' after 4 ns, '0' after 6 ns, '1' after 8 ns, '0' after 10 ns;
  phase  <= 0, 1 after 3 ns, 2 after 6 ns, 3 after 9 ns, 0 after 12 ns;
  clk    <= s_osc;
  strobe <= '1' after 5 ns, '0' after 7 ns;
end architecture bh;
