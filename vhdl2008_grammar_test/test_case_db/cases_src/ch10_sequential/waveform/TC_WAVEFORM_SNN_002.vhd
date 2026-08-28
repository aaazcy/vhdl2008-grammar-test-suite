-- =============================================================
-- Case ID: TC_WAVEFORM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Negative
-- Test Focus: SNN: time_expression missing after after — in s <= 5 after ; there is no time expression on the right side of after, the time_expression is missing from the [ after time_expression ] structure of waveform_element
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity wf_missing_time_expr is
  port (
    y : out integer
  );
end entity wf_missing_time_expr;

architecture vhdl2008 of wf_missing_time_expr is
  signal s : integer := 0;
begin
  s <= 5 after;
  y <= s;
end architecture vhdl2008;
