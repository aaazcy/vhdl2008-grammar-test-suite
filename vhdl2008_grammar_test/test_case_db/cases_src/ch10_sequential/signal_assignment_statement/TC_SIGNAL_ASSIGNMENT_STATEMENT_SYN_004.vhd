-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Transport delay signal assignment: delay_mechanism is transport + waveform with multi-value chain `1 after 5ns, 2 after 10ns, 3 after 15ns`, verifying the multi-value waveform under transport delay mode
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_trans_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sas_trans_ent is
  signal s_t:integer:=0;
begin
  process(a) begin
    s_t<=transport a after 5 ns, a+1 after 10 ns, a+2 after 15 ns;
    y<=s_t;
  end process;
end architecture bh;
