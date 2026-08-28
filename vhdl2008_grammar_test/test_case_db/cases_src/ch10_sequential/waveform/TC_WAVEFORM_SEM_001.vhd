-- =============================================================
-- Case ID: TC_WAVEFORM_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive
-- Test Focus: Waveform in a process with wait statements — tests semantic correctness of waveform across multiple process iterations. Uses qualified expressions and parenthesized expressions as value_expressions in waveform_elements, verifying that arbitrary value_expressions are accepted.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_sem1_ent is
  port (
    clk    : in  bit;
    data   : out integer;
    ready  : out bit
  );
end entity wf_sem1_ent;

architecture bh of wf_sem1_ent is
  signal s_data  : integer := 0;
  signal s_ready : bit     := '0';
  signal s_count : natural := 0;
begin
  process
    variable v : integer := 0;
  begin
    wait until clk = '1';
    v := v + 1;
    -- Waveform with parenthesized value_expression
    s_data  <= (v * 2) after 2 ns, (v * 2 + 1) after 6 ns;
    -- Waveform with qualified value_expression (integer'())
    s_ready <= '0' after 1 ns, '1' after 4 ns;
    s_count <= s_count + 1;
    data    <= s_data;
    ready   <= s_ready;
  end process;
end architecture bh;
