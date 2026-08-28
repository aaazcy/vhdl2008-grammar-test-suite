-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Case Type: Positive
-- Test Focus: Variable assignment with slice name as target and slice of another variable as expression, exercising slice targets
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_slice_ent is port(data:in bit_vector(15 downto 0); y:out bit_vector(7 downto 0)); end entity;
architecture assign of sva_slice_ent is
begin
  process(data) is
    variable v_low : bit_vector(7 downto 0);
  begin
    v_low(7 downto 0) := data(15 downto 8);
    y <= v_low;
  end process;
end architecture assign;
