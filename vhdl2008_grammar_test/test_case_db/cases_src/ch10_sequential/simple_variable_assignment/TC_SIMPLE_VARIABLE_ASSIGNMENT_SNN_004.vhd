-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Case Type: Negative
-- Test Focus: Single colon instead of `:=` operator — target : expression, targeting the compound assignment operator token
-- Expected Result: Triggers syntax error: expected `:=` but found `:`
-- Dependencies: None
-- =============================================================
entity sva_sglcol_ent is port(clk:in bit; y:out integer); end entity;
architecture assign of sva_sglcol_ent is
begin
  process(clk) is
    variable v : integer;
  begin
    v : 42;
    y <= v;
  end process;
end architecture assign;
