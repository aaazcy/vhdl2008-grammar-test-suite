-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Aggregate target signal assignment: target (s_a,s_b) aggregate receives record fields returned by a function, verifying that the aggregate form of target can use multiple signals as assignment destinations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_agg_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sas_agg_ent is
  signal s_a,s_b:integer:=0;
  type t_pair is record x:integer; y:integer; end record;
  function f_swap(p:t_pair) return t_pair is begin return (x=>p.y,y=>p.x); end function;
begin
  process(a,b) begin
    (s_a,s_b)<=t_pair'(x=>a,y=>b);
    y<=s_a+s_b;
  end process;
end architecture bh;
