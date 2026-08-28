-- =============================================================
-- Case ID: TC_WAVEFORM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Negative
-- Test Focus: Type mismatch in waveform element — the waveform_element value_expression is of type bit but the target signal is of type integer. Verifies semantic type-checking across waveform assignment. The waveform_element value must be assignment-compatible with the target.
-- Expected Result: Triggers semantic error (type mismatch)
-- Dependencies: None
-- =============================================================
entity wf_smn1_ent is
  port (
    ok_out : out integer;
    bad_in : in  bit
  );
end entity wf_smn1_ent;

architecture bh of wf_smn1_ent is
  signal s_ok  : integer := 0;
  signal s_bad : integer := 0;
begin
  -- OK: integer value in integer waveform
  s_ok  <= 0 after 1 ns, 10 after 5 ns;
  -- ERROR: bit value assigned to integer signal via waveform
  s_bad <= '1' after 2 ns, '0' after 8 ns;
  ok_out <= s_ok;
end architecture bh;
