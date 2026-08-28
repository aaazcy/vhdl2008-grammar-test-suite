-- =============================================================
-- Case ID: TC_SELECTED_SIGNAL_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_signal_assignment ::= selected_waveform_assignment | selected_force_assignment
-- Case Type: Positive
-- Test Focus: VHDL 2008 matching selected signal assignment: with-select? uses the matching select form, with a selector of type bit_vector, verifying the matching select `?` form of selected_signal_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssa_syn5_ent is port(sel:in bit_vector(1 downto 0); a,b,c,d:in integer; y:out integer); end entity;
architecture bh of ssa_syn5_ent is
  signal s_mux:integer:=0;
begin
  process(sel,a,b,c,d) begin
    with sel select? s_mux <=
      a when "00",
      b when "01",
      c when "10",
      d when "11";
    y <= s_mux;
  end process;
end architecture bh;
