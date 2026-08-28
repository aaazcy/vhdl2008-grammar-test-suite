-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: signal_assignment_statement ::= [ label : ] simple_signal_assignment | [ label : ] conditional_signal_assignment | [ label : ] selected_signal_assignment
-- Case Type: Positive
-- Test Focus: Selected signal assignment form: with-select as a sequential statement, with label "l_sel", target s_mux, selecting different waveform values based on signal sel, verifying the selected_signal_assignment branch of signal_assignment_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_sel_ent is port(sel:in integer range 0 to 3; a,b,c,d:in integer; y:out integer); end entity;
architecture bh of sas_sel_ent is
  signal s_mux:integer:=0;
begin
  process(sel,a,b,c,d) begin
    l_sel: with sel select s_mux <=
      a when 0,
      b when 1,
      c when 2,
      d when 3;
    y <= s_mux;
  end process;
end architecture bh;
