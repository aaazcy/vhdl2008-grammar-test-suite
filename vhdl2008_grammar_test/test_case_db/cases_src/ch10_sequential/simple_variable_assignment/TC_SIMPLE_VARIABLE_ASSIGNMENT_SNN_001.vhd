-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Case Type: Negative
-- Test Focus: Missing `:=` operator in simple_variable_assignment — target directly followed by expression without assignment operator
-- Expected Result: Triggers syntax error: missing `:=` operator
-- Dependencies: None
-- =============================================================
entity sva_missop_ent is port(clk:in bit; y:out integer); end entity;
architecture assign of sva_missop_ent is
begin
  process(clk) is
    variable v : integer;
  begin
    v 42;
    y <= v;
  end process;
end architecture assign;
