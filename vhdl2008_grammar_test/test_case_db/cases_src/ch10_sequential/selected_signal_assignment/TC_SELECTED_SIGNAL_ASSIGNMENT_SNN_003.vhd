-- =============================================================
-- Case ID: TC_SELECTED_SIGNAL_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_signal_assignment ::= selected_waveform_assignment | selected_force_assignment
-- Case Type: Negative
-- Test Focus: SNN: Missing `when` — in `with sel select s_mux <= a 0, b 1;` a choice value directly follows the waveform, skipping when, verifying that the waveform selection of selected_signal_assignment requires the when keyword
-- Expected Result: Triggers syntax error: missing "when" in selected signal assignment
-- Dependencies: None
-- =============================================================
entity ssa_snn3_ent is port(sel:in bit; a,b:in integer; y:out integer); end entity;
architecture bh of ssa_snn3_ent is
  signal s_mux:integer:=0;
begin
  process(sel,a,b) begin
    with sel select s_mux <= a '0', b '1';
    y <= s_mux;
  end process;
end architecture bh;
