-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: subprogram_statement_part with the combination while_loop+variable_assignment+return: inside the function a while loop iterates and accumulates until the condition is met, verifies the execution semantics of while in a subprogram
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssp_while_ent is port(n:in integer; result:out integer); end entity;
architecture bh of ssp_while_ent is
  function f_sum_to_n(limit:integer) return integer is
    variable total:integer:=0;
    variable i:integer:=1;
  begin
    while i<=limit loop
      total:=total+i;
      i:=i+1;
    end loop;
    return total;
  end function;
begin
  result<=f_sum_to_n(n);
end architecture bh;
