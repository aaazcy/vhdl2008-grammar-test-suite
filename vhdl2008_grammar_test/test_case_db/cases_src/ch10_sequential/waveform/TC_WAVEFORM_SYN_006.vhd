-- =============================================================
-- Case ID: TC_WAVEFORM_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive
-- Test Focus: unaffected in conditional signal assignment — the waveform unaffected appears in the else branch of a concurrent conditional signal assignment. Tests the unaffected alternative of the waveform BNF in a conditional context.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_cond_ent is
  port (
    en     : in  bit;
    a_in   : in  integer;
    result : out integer
  );
end entity wf_cond_ent;

architecture bh of wf_cond_ent is
  signal s_out : integer := 0;
begin
  -- unaffected in conditional waveform
  s_out  <= a_in after 5 ns when en = '1' else unaffected;
  result <= s_out after 1 ns, s_out + 1 after 10 ns;
end architecture bh;
