-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: signal_assignment_statement ::= [ label : ] simple_signal_assignment | [ label : ] conditional_signal_assignment | [ label : ] selected_signal_assignment
-- Case Type: Positive
-- Test Focus: Conditional signal assignment form: conditional signal assignment as a sequential statement, with label "l_cond", target s_res, selecting different values via a when-else chain, verifying the conditional_signal_assignment branch of signal_assignment_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_cond_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sas_cond_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    l_cond: s_res <= 100 when a > b else
                      50 when a < b else
                       0;
    y <= s_res;
  end process;
end architecture bh;
