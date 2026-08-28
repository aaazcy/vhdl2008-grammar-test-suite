-- =============================================================
-- Case ID: TC_WAVEFORM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive
-- Test Focus: Waveform elements with and without after clause — first element omits after (immediate assignment), subsequent elements include after time_expression. Tests the optional [ after time_expression ] inside waveform_element.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_noafter_ent is
  port (
    clk_out  : out bit;
    data_out : out integer;
    status   : out boolean
  );
end entity wf_noafter_ent;

architecture bh of wf_noafter_ent is
  signal s_clk : bit := '0';
begin
  -- Waveform element without after clause
  s_clk <= not s_clk after 5 ns;
  -- Mixed: first element no after, remaining with after
  data_out <= 0, 1 after 10 ns, 2 after 20 ns, 3 after 30 ns;
  clk_out  <= s_clk;
  status   <= false, true after 15 ns;
end architecture bh;
