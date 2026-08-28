-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SVA_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Rule Description: Variable assignment target and expression types must match
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: Assign bit_vector literal to integer variable, triggering type mismatch in simple_variable_assignment
-- Expected Result: Triggers semantic error: type mismatch in variable assignment
-- Dependencies: None
-- =============================================================
entity sva_type_ent is port(clk:in bit; y:out integer); end entity;
architecture assign of sva_type_ent is
begin
  process(clk) is
    variable v : integer;
  begin
    v := X"FF";
    y <= v;
  end process;
end architecture assign;
