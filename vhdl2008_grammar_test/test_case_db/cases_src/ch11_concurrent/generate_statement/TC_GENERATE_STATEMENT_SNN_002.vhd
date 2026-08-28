-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement ::= for_generate_statement if_generate_statement | case_generate_statement
-- Case Type: Negative
-- Test Focus: generate_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generate_statem_e2 is end entity;
architecture bh of generate_statem_e2 is
  -- ERROR: invalid syntax in generate_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;