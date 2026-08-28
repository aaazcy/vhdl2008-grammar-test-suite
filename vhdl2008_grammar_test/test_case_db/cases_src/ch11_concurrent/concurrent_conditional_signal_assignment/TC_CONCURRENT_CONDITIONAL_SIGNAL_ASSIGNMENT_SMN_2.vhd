-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_CCSA_TYPE
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: Waveform types in concurrent conditional assignment must match target type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: type mismatch in concurrent conditional signal assignment branches
-- Expected Result: Triggers semantic error: conditional waveform type mismatch
-- Dependencies: None
-- =============================================================
entity ccsa_sem1_ent is port(sel:in bit; y:out integer); end entity;
architecture bh of ccsa_sem1_ent is
  signal s_t:integer:=0;
begin
  s_t <= 5 when sel='1' else '0';
  y<=s_t;
end architecture bh;
