-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_GEN_SPEC_RANGE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Rule Description: Generate range bounds must be compatible types
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: incompatible bound types in generate specification range
-- Expected Result: Triggers semantic error: range bound type mismatch
-- Dependencies: None
-- =============================================================
entity gen_spec_smn1_ent is port(y:out integer); end entity;
architecture bh of gen_spec_smn1_ent is
begin
  g1: for i in 0 to '1' generate
    y<=0;
  end generate;
end architecture bh;
