-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: SNN: delay_mechanism keyword misspelled — `transportt` has an extra character, verifying that the transport keyword must be spelled exactly
-- Expected Result: Triggers syntax error: unrecognized keyword
-- Dependencies: None
-- =============================================================
entity sas_snn3_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sas_snn3_ent is signal s_val:integer:=0;
begin process(a) begin s_val<=transportt a after 5 ns; y<=s_val; end process; end architecture bh;
