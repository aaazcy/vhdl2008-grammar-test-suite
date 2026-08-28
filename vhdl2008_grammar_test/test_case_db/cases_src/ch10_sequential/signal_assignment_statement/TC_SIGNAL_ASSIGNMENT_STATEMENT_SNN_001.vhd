-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: SNN: missing `<=` — `s_val 42;` uses a space instead of the assignment arrow, verifying that signal_assignment requires `<=` as the mandatory separator between target and waveform
-- Expected Result: Triggers syntax error: missing "<=" in signal assignment
-- Dependencies: None
-- =============================================================
entity sas_snn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sas_snn1_ent is
  signal s_val:integer:=0;
begin
  process(a) begin
    s_val a; y<=s_val;
  end process;
end architecture bh;
