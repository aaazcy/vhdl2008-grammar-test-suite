-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Case Type: Negative
-- Test Focus: case_generate_alternative: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity case_generate_a_e2 is end entity;
architecture bh of case_generate_a_e2 is
  -- ERROR: invalid syntax in case_generate_alternative
  signal s : bit;
begin
  s <= '1'
end architecture bh;