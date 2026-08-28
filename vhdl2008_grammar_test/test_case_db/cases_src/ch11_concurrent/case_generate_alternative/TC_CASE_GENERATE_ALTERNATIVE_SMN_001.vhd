-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CGA_COVERAGE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Rule Description: Case generate must cover all expression values
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: incomplete coverage in case generate (missing others, missing 2,3)
-- Expected Result: Triggers semantic error: incomplete case generate coverage
-- Dependencies: None
-- =============================================================
entity cga_smn1_ent is port(y:out integer); end entity;
architecture bh of cga_smn1_ent is
  constant C_SEL:integer:=0;
begin
  g1: case C_SEL generate
    when 0 => y<=10;
    when 1 => y<=20;
  end generate;
end architecture bh;
