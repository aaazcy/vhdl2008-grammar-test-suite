-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: For-loop ascending + descending + labeled: 3 for-loops respectively using ascending range (0 to 7) / descending range (7 downto 0) / labeled loop (l_sum), verifies the identifier in discrete_range form of parameter_specification and loop_label syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_for_ent is port(start:in bit; y:out integer); end entity;
architecture bh of loop_for_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_arr:t_arr:=(others=>0);
  signal s_sum:integer:=0;
begin
  process(start)
    variable v_tmp:integer:=0;
  begin
    for i in 0 to 7 loop
      s_arr(i)<=i*2;
    end loop;
    for i in 7 downto 0 loop
      v_tmp:=v_tmp+s_arr(i);
    end loop;
    l_sum:for i in 0 to 3 loop
      s_sum<=s_sum+i;
    end loop l_sum;
    y<=v_tmp+s_sum;
  end process;
end architecture bh;
