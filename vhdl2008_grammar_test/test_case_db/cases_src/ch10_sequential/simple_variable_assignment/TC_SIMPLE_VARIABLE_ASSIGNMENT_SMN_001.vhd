-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SVA_RANGE
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Rule Description: Variable assignment value must be within variable's subtype range
-- Case Type: Negative
-- Error Category: range_error
-- Test Focus: Assign 100 to variable constrained to 0..10, exceeding subtype range in simple_variable_assignment
-- Expected Result: Triggers semantic error: value out of range
-- Dependencies: None
-- =============================================================
entity sva_range_ent is port(clk:in bit; y:out integer); end entity;
architecture assign of sva_range_ent is
begin
  process(clk) is
    variable v : integer range 0 to 10;
  begin
    v := 100;
    y <= v;
  end process;
end architecture assign;
