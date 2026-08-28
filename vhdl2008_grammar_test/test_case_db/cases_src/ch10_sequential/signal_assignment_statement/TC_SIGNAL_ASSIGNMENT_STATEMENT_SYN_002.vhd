-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Signal assignment with label: label "l_drive" + target is indexed signal s_arr(idx) + waveform is expression a+b, verifying the label syntax of signal_assignment and indexed_name as target
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_label_ent is port(a,b:in integer; idx:in integer range 0 to 7; y:out integer); end entity;
architecture bh of sas_label_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_arr:t_arr:=(others=>0);
begin
  process(a,b,idx) begin
    l_drive:s_arr(idx)<=a+b;
    y<=s_arr(idx);
  end process;
end architecture bh;
