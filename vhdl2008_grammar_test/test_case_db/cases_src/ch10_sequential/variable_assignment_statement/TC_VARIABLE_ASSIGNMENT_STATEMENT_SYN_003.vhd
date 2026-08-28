-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: variable_assignment_statement ::= [ label : ] target := expression ;
-- Case Type: Positive
-- Test Focus: Aggregate target variable assignment: target is the (v_a,v_b) aggregate receiving record decomposition, the expression is a record returned by a function, verifying the aggregate target syntax of variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vas3_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of vas3_ent is
  type t_pair is record x:integer; y:integer; end record;
  function f_pair(a,b:integer) return t_pair is begin return (x=>a,y=>b); end function;
  signal s_res:integer:=0;
begin
  process(a,b) variable v_a,v_b:integer;
  begin
    (v_a,v_b):=f_pair(a,b);
    s_res<=v_a+v_b;
  end process;
  y<=s_res;
end architecture bh;
