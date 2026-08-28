-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_GEN_SPEC_CONSTANT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Rule Description: Generate specification range must be static
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: non-static range in for generate specification
-- Expected Result: Triggers semantic error: generate range must be static
-- Dependencies: None
-- =============================================================
entity gen_spec_sem1_ent is port(y:out integer); end entity;
architecture bh of gen_spec_sem1_ent is
  signal s_n:integer:=4;
begin
  g1: for i in 0 to s_n generate
    y<=i;
  end generate;
end architecture bh;
