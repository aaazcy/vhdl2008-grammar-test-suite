-- =============================================================
-- Case ID: TC_WAVEFORM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Negative
-- Test Focus: SNN: Two consecutive commas appear between two waveform_elements in the waveform list — in s <= 5,, 6 a waveform_element is missing at the second comma, breaking the { , waveform_element } structure of waveform
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity wf_double_comma is
  port (
    y : out integer
  );
end entity wf_double_comma;

architecture vhdl2008 of wf_double_comma is
  signal s : integer := 0;
begin
  s <= 5,, 6;
  y <= s;
end architecture vhdl2008;
