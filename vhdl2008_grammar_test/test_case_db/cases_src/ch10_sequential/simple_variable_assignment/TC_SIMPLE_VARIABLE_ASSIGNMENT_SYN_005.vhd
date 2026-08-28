-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Case Type: Positive
-- Test Focus: Variable assignment with type conversion as RHS expression, exercising type_conversion in expression subtree
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_tyconv_ent is port(b:in real; y:out integer); end entity;
architecture assign of sva_tyconv_ent is
begin
  process(b) is
    variable v : integer;
  begin
    v := integer(b);
    y <= v;
  end process;
end architecture assign;
