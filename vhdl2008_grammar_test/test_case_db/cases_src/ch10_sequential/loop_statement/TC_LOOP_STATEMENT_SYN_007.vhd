-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: While-loop compound boolean condition: the while condition is `(v_lo < 16) and (v_hi >= 0) and (v_sum < 1000)`, an AND combination of three conditions, two counters inside the loop body approach from both directions (lo incrementing/hi decrementing), exit when additional condition breaks out — verifies condition can be any arbitrarily complex boolean expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_while_cmplx_ent is
  port(go:in bit; q:out integer; done:out bit);
end entity;
architecture bh of loop_while_cmplx_ent is
begin
  process(go)
    variable v_lo:integer:=0;
    variable v_hi:integer:=15;
    variable v_sum:integer:=0;
  begin
    v_lo:=0; v_hi:=15; v_sum:=0; done<='0';
    l_scan: while (v_lo < 16) and (v_hi >= 0) and (v_sum < 1000) loop
      v_sum:=v_sum + v_lo*v_hi;
      v_lo:=v_lo+1;
      v_hi:=v_hi-1;
      exit l_scan when v_lo > v_hi;
    end loop l_scan;
    q<=v_sum;
    done<='1';
  end process;
end architecture bh;
