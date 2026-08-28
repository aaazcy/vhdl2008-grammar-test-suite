-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Record field target: target is selected_name s_rec.data assignment + another target s_rec.flag, verifying that target accepts a record field selected_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_rec_ent is port(a:in integer; en:in bit; y:out integer); end entity;
architecture bh of sas_rec_ent is
  type t_pkt is record data:integer; flag:bit; end record;
  signal s_rec:t_pkt:=(data=>0,flag=>'0');
begin
  process(a,en) begin
    s_rec.data<=a;
    s_rec.flag<=en;
    y<=s_rec.data when s_rec.flag='1' else 0;
  end process;
end architecture bh;
