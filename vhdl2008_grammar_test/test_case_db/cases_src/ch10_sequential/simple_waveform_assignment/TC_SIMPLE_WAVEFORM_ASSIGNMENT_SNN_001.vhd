-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: Missing `<=` signal assignment operator — target directly followed by waveform expression without the compound assignment arrow
-- Expected Result: Triggers syntax error: missing `<=` operator
-- Dependencies: None
-- =============================================================
entity swa_missarr_ent is port(data:in integer; y:out integer); end entity;
architecture assign of swa_missarr_ent is
  signal s_reg : integer;
begin
  s_reg data;
  y <= s_reg;
end architecture assign;
