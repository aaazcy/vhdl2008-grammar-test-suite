-- =============================================================
-- Case ID: TC_SELECTED_SIGNAL_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_signal_assignment ::= selected_waveform_assignment | selected_force_assignment
-- Case Type: Positive
-- Test Focus: Minimal form of selected signal assignment: target s_mux selects a or b with-select based on sel, only 2 branches with no label and no delay, verifying the minimal with-select syntax of selected_signal_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssa_syn2_ent is port(sel:in bit; a,b:in integer; y:out integer); end entity;
architecture bh of ssa_syn2_ent is
  signal s_mux:integer:=0;
begin
  process(sel,a,b) begin
    with sel select s_mux <=
      a when '0',
      b when '1';
    y <= s_mux;
  end process;
end architecture bh;
