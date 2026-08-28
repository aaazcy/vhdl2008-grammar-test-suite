-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: case_generate_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity case_generate_s_e3 is end entity;
architecture bh of case_generate_s_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;