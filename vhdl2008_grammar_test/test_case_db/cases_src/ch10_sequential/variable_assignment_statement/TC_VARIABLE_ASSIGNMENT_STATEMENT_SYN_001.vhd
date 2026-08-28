-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: variable_assignment_statement ::= [ label : ] target := expression ;
-- Case Type: Positive
-- Test Focus: Variable assignment with label + composite target: a labeled variable assignment whose aggregate target `(v_a,v_b)` receives the record decomposition returned by a function, verifying the label, aggregate target, and function-call expression of variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vas_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of vas_ent is
  type t_pair is record x:integer; y:integer; end record;
  function f_swap(p:t_pair) return t_pair is
  begin return t_pair'(x=>p.y,y=>p.x); end function;
begin
  process(a,b)
    variable v_a,v_b:integer;
  begin
    l_swap:(v_a,v_b):=f_swap(t_pair'(a,b));
    y<=v_a+v_b;
  end process;
end architecture bh;
