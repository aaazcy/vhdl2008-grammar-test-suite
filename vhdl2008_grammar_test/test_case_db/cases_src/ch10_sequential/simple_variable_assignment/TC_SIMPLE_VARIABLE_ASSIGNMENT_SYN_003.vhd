-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Case Type: Positive
-- Test Focus: Labeled variable assignment with function call expression on RHS, exercising label + function_call in expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_lblfn_ent is port(a,b:in integer; y:out integer); end entity;
architecture assign of sva_lblfn_ent is
  function f_comp(x, y_int : integer) return integer is
  begin
    if x > y_int then return x; else return y_int; end if;
  end function;
begin
  process(a, b) is
    variable v : integer;
  begin
    lbl_assign: v := f_comp(a, b);
    y <= v;
  end process;
end architecture assign;
