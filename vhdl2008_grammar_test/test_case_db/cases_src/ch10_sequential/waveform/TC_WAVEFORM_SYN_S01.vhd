-- =============================================================
-- Case ID: TC_WAVEFORM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: WAVEFORM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: waveform ::= waveform_element { , waveform_element } | unaffected
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific — waveform used inside a process with a wait statement, demonstrating sequential signal assignment context. A two-element waveform chain with an aggregate value_expression in the waveform_element.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wf_proc_ent is
  port (
    clk    : in  bit;
    result : out integer
  );
end entity wf_proc_ent;

architecture bh of wf_proc_ent is
  signal s_acc : integer := 0;
begin
  process
  begin
    wait until clk = '1';
    -- Waveform inside sequential context (process)
    s_acc  <= s_acc + 1 after 1 ns, s_acc + 2 after 5 ns;
    result <= s_acc;
  end process;
end architecture bh;
