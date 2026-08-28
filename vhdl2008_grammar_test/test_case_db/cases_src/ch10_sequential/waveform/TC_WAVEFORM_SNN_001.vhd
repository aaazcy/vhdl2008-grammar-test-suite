-- =============================================================
-- Case ID: TC_WAVEFORM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Negative
-- Test Focus: Missing comma in waveform chain — two waveform_elements are not separated by a comma, violating the { , waveform_element } repetition rule. The parser expects a comma between consecutive waveform_elements.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity wf_snn1_ent is
  port (
    a : in  integer;
    b : out integer
  );
end entity wf_snn1_ent;

architecture bh of wf_snn1_ent is
  signal s : integer := 0;
begin
  -- ERROR: missing comma between waveform_elements
  s <= a after 5 ns a + 1 after 10 ns;
  b <= s;
end architecture bh;
