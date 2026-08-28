-- =============================================================
-- Case ID: TC_WAVEFORM_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Negative
-- Test Focus: Missing value_expression in waveform_element — the after keyword appears without a preceding value_expression. The waveform_element requires a value_expression before the optional after clause; using after alone violates the waveform_element ::= value_expression [ after time_expression ] structure.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity wf_snn5_ent is
  port (
    y : out integer
  );
end entity wf_snn5_ent;

architecture bh of wf_snn5_ent is
  signal s : integer := 0;
begin
  -- ERROR: no value_expression before after
  s <= after 10 ns;
  y <= s;
end architecture bh;
