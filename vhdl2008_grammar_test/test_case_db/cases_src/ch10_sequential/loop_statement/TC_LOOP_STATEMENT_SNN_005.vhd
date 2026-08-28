-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "loop" keyword after the while condition — `while v<10` is directly followed by `v:=v+1;` (i.e., the first statement of sequence_of_statements appears), the required "loop" delimiter is missing, verifies the while iteration_scheme must be followed by the "loop" keyword
-- Expected Result: Triggers syntax error: missing "loop" keyword after while condition
-- Dependencies: None
-- =============================================================
entity loop_while_no_loop_ent is port(q:out integer); end entity;
architecture bh of loop_while_no_loop_ent is
begin
  process is
    variable v:integer:=0;
  begin
    while v<10 v:=v+1; end loop;
    q<=v;
    wait;
  end process;
end architecture bh;
