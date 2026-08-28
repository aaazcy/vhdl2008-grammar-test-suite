-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Case Type: Negative
-- Test Focus: case_generate_alternative: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity case_generate_a_e3 is end entity;
architecture bh of case_generate_a_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;