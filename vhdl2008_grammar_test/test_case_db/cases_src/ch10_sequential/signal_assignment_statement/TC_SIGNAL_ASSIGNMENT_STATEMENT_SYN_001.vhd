-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Minimal signal assignment: no label, target is simple signal name s_val, no delay_mechanism, waveform is a single integer literal `42`, verifying that the minimal signal_assignment with only target<=value compiles
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_min_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sas_min_ent is
  signal s_val:integer:=0;
begin
  process(a) begin
    s_val<=a;
    y<=s_val;
  end process;
end architecture bh;
