-- =============================================================
-- Case ID: TC_WAVEFORM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive
-- Test Focus: unaffected keyword in selected signal assignment — the waveform can be the keyword unaffected (the second BNF alternative). Here unaffected appears in a concurrent selected signal assignment alongside normal waveform branches.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_unaffected_ent is
  port (
    sel    : in  integer range 0 to 3;
    result : out integer;
    stable : out bit
  );
end entity wf_unaffected_ent;

architecture bh of wf_unaffected_ent is
  signal s_val : integer := 0;
begin
  -- unaffected in selected waveform assignment
  with sel select
    s_val <= 10 after 5 ns when 0,
             20 after 5 ns when 1,
             30 after 5 ns when 2,
             unaffected when others;
  result <= s_val;
  stable <= '0' after 1 ns, '1' after 5 ns;
end architecture bh;
