-- =============================================================
-- Case ID: TC_SIMPLE_VARIABLE_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: simple_variable_assignment ::= target := expression ;
-- Case Type: Negative
-- Test Focus: Missing semicolon terminator in simple_variable_assignment — target := expression present but semicolon omitted, targeting the `;` token from the BNF
-- Expected Result: Triggers syntax error: missing terminating semicolon
-- Dependencies: None
-- =============================================================
entity sva_misssemi_ent is port(clk:in bit; y:out integer); end entity;
architecture assign of sva_misssemi_ent is
begin
  process(clk) is
    variable v : integer;
  begin
    v := 42
    y <= v;
  end process;
end architecture assign;
