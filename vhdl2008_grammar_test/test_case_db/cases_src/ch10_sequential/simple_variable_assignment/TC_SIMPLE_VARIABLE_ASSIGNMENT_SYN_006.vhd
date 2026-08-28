-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Case Type: Positive
-- Test Focus: Variable assignment inside subprogram body, exercising simple_variable_assignment in subprogram context rather than process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_subprog_ent is port(a:in integer; y:out integer); end entity;
architecture assign of sva_subprog_ent is
  function double(x : integer) return integer is
    variable tmp : integer;
  begin
    tmp := x * 2;
    return tmp;
  end function;
begin
  y <= double(a);
end architecture assign;
