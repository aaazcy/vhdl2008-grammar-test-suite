-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Reject+inertial delay: delay_mechanism is `reject 2 ns inertial` + waveform with after time, verifying the inertial delay syntax where the reject keyword specifies the pulse rejection threshold
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_reject_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sas_reject_ent is
  signal s_r:integer:=0;
begin
  process(a) begin
    s_r<=reject 2 ns inertial a after 10 ns;
    y<=s_r;
  end process;
end architecture bh;
