-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement ::= for_generate_statement if_generate_statement | case_generate_statement
-- Case Type: Negative
-- Test Focus: generate_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generate_statem_e3 is end entity;
architecture bh of generate_statem_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;