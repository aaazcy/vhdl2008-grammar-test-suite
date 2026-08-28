-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: exit statement appears outside loop context — `exit when true;` appears directly after process begin and before the loop statement, exit_statement can only be used inside a loop, appearing outside a loop triggers a syntax/semantic error
-- Expected Result: Triggers error: exit statement not within a loop
-- Dependencies: None
-- =============================================================
entity loop_exit_no_loop_ent is port(q:out integer); end entity;
architecture bh of loop_exit_no_loop_ent is
begin
  process is
  begin
    exit when true;
    q<=1;
    wait;
  end process;
end architecture bh;
