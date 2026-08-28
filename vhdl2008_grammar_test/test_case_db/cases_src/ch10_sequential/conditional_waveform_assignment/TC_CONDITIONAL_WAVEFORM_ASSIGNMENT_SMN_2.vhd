-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORM_ASSIGNMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_002
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveform_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Rule Description: Conditions in conditional waveform assignment must be of type BOOLEAN
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: when-condition uses integer port `a` as BOOLEAN condition, triggering type error in conditional_waveform_assignment — condition must be BOOLEAN type
-- Expected Result: Triggers semantic error: condition must be BOOLEAN type
-- Dependencies: None
-- =============================================================
entity cwa_sem1_ent is port(a:in integer; y:out integer); end entity;
architecture assign of cwa_sem1_ent is
  signal s_res : integer := 0;
begin
  s_res <= 100 when a else 0;
  y <= s_res;
end architecture assign;
