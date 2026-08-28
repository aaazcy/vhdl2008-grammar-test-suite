-- =============================================================
-- Case ID: TC_SELECTED_SIGNAL_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_signal_assignment ::= selected_waveform_assignment | selected_force_assignment
-- Case Type: Negative
-- Test Focus: SNN: Missing `select` — in `with sel s_mux <= a when 0, b when 1;` a signal name directly follows with, skipping the select keyword, verifying that selected_signal_assignment requires the select keyword
-- Expected Result: Triggers syntax error: missing "select" in selected signal assignment
-- Dependencies: None
-- =============================================================
entity ssa_snn1_ent is port(sel:in bit; a,b:in integer; y:out integer); end entity;
architecture bh of ssa_snn1_ent is
  signal s_mux:integer:=0;
begin
  process(sel,a,b) begin
    with sel s_mux <= a when '0', b when '1';
    y <= s_mux;
  end process;
end architecture bh;
