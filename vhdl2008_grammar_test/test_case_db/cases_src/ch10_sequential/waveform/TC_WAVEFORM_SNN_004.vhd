-- =============================================================
-- Case ID: TC_WAVEFORM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Negative
-- Test Focus: Dangling comma in waveform list — a trailing comma appears after the last waveform_element, implying an expected but missing subsequent element. Violates the { , waveform_element } structure where each comma must precede an actual waveform_element.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity wf_snn4_ent is
  port (
    clk   : out bit;
    data  : out integer
  );
end entity wf_snn4_ent;

architecture bh of wf_snn4_ent is
  signal s : integer := 0;
begin
  -- ERROR: trailing comma after last waveform_element
  s    <= 1 after 5 ns, 2 after 10 ns, ;
  clk  <= '0' after 1 ns, '1' after 3 ns;
  data <= s;
end architecture bh;
