-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_010
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Rule Description: For-loop parameter (loop parameter) is immutable within the loop body — an assignment operation (variable assignment) to the loop parameter triggers a semantic error, because the identifier declared by parameter_specification is an implicit constant
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Negative
-- Error Category: loop_parameter_immutable
-- Test Focus: negative case: the for-loop parameter `i` is assigned `i:=i+1;` inside the loop body, violating the semantic constraint that the loop parameter is immutable — the loop parameter is an implicit constant and cannot be an assignment target
-- Expected Result: Triggers semantic error: cannot assign to loop parameter
-- Dependencies: None
-- =============================================================
entity loop_immut_ent is port(q:out integer); end entity;
architecture bh of loop_immut_ent is
  signal s:integer:=0;
begin
  process is
  begin
    for i in 0 to 7 loop
      s<=s+i;
      i:=i+1;
    end loop;
    q<=s;
    wait;
  end process;
end architecture bh;
