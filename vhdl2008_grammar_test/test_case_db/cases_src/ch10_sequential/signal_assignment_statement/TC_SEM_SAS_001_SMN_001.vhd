-- =============================================================
-- Case ID: TC_SEM_SAS_001_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SAS_001
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Rule Description: Signal assignment waveform type must be compatible with the target type — a type mismatch triggers a type_mismatch error
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: Negative example: target is integer signal s_val, but the waveform assigns a bit_vector literal `X"FF"`, verifying that the analyzer detects the waveform expression type as incompatible with the signal subtype_indication
-- Expected Result: Triggers semantic error: type mismatch in signal assignment
-- Dependencies: None
-- =============================================================
entity sas_smn_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sas_smn_ent is
  signal s_val:integer:=0;
begin
  process(a) begin
    s_val<=X"FF"; y<=a;
  end process;
end architecture bh;
