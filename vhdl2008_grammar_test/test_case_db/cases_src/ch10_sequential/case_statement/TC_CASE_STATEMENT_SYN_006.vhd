-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Positive
-- Test Focus: Case within loop + complex sequence_of_statements: case is inside a for loop, each when branch contains multiple statements (variable assignment + signal assignment + nested if), verifying case works in a loop context and branch bodies can hold any sequence of sequential_statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_loop_ent is
  port(sel:in integer range 0 to 3; y:out integer);
end entity;
architecture bh of case_loop_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_arr:t_arr:=(others=>0);
  signal s_sum:integer:=0;
begin
  process(sel)
    variable v_tmp:integer:=0;
  begin
    s_sum<=0;
    for i in 0 to 7 loop
      case sel is
        when 0 => v_tmp:=i;      s_arr(i)<=v_tmp;
        when 1 => v_tmp:=i*2;    s_arr(i)<=v_tmp;
        when 2 => v_tmp:=i*i;    s_arr(i)<=v_tmp;
        when 3 => v_tmp:=256-i;  s_arr(i)<=v_tmp;
      end case;
      s_sum<=s_sum+v_tmp;
    end loop;
    y<=s_sum;
  end process;
end architecture bh;
