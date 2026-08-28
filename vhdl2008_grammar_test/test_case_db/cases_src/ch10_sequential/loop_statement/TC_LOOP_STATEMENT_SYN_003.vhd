-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: While-loop + exit/next: the while loop contains loop_label "l_while", the body contains exit when for conditional break + next when for conditional skip, verifies the complete interaction of while iteration_scheme + exit_statement + next_statement in the loop body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_while_ent is port(val:in integer; y:out integer); end entity;
architecture bh of loop_while_ent is
  signal s_res:integer:=0;
begin
  process(val)
    variable v_cnt:integer:=0;
    variable v_acc:integer:=0;
  begin
    v_cnt:=0; v_acc:=0;
    l_while:while v_cnt<val loop
      v_cnt:=v_cnt+1;
      next l_while when v_cnt mod 2=0;
      v_acc:=v_acc+v_cnt;
      exit l_while when v_acc>1000;
    end loop l_while;
    s_res<=v_acc; y<=s_res;
  end process;
end architecture bh;
