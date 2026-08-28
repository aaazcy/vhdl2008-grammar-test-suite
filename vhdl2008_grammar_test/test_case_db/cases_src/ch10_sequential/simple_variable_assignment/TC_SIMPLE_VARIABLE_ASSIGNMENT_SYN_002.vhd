-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Case Type: Positive
-- Test Focus: Variable assignment with arithmetic expression on RHS, exercising operator precedence in expression subtree
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_arith_ent is port(a,b,c:in integer; y:out integer); end entity;
architecture assign of sva_arith_ent is
begin
  process(a, b, c) is
    variable v : integer;
  begin
    v := a + b * c;
    y <= v;
  end process;
end architecture assign;
