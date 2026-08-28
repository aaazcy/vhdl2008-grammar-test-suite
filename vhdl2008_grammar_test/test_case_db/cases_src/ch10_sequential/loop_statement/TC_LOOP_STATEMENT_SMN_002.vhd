-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_011
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Rule Description: the condition of while-loop must be a boolean expression — after while an integer literal "42" (not boolean) appears, the type mismatch triggers a semantic error
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Negative
-- Error Category: type_mismatch_while_condition
-- Test Focus: negative case: the while condition is an integer literal `42` instead of a boolean expression, verifies the while condition must be of boolean type, integer cannot be implicitly converted to boolean
-- Expected Result: Triggers semantic error: while condition must be boolean type
-- Dependencies: None
-- =============================================================
entity loop_while_nonbool_ent is port(q:out integer); end entity;
architecture bh of loop_while_nonbool_ent is
begin
  process is
    variable v:integer:=0;
  begin
    while 42 loop
      v:=v+1;
      exit when v>=5;
    end loop;
    q<=v;
    wait;
  end process;
end architecture bh;
