-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "end loop" keyword — "end process" appears directly after the sequence_of_statements of the for loop ends, the loop body is not closed, the "end loop" keyword is missing, the parser detects the loop is not properly terminated when it encounters end process
-- Expected Result: Triggers syntax error: missing "end loop" keyword, loop not closed before end process
-- Dependencies: None
-- =============================================================
entity loop_no_end_loop_ent is port(q:out integer); end entity;
architecture bh of loop_no_end_loop_ent is
  signal s:integer:=0;
begin
  process is
  begin
    for i in 0 to 7 loop
      s <= s + i;
  end process;
  q <= s;
end architecture bh;
