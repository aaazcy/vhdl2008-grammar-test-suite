-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: SNN: target is a literal — `42<=s_val;` a numeric literal cannot be an assignment destination, verifying that target must be a signal name or aggregate, not a literal/expression
-- Expected Result: Triggers syntax error: invalid target
-- Dependencies: None
-- =============================================================
entity sas_snn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sas_snn2_ent is signal s_val:integer:=0;
begin process(a) begin 42<=s_val; y<=a; end process; end architecture bh;
