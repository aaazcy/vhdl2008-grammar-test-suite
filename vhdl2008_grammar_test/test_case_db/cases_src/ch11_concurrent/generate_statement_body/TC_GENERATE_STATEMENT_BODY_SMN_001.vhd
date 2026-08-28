-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_GEN_BODY_LABEL
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Rule Description: End generate label must match generate label
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: mismatched end generate label
-- Expected Result: Triggers semantic error: generate label mismatch
-- Dependencies: None
-- =============================================================
entity gen_body_smn1_ent is port(y:out integer); end entity;
architecture bh of gen_body_smn1_ent is
begin
  g1: for i in 0 to 3 generate
  begin
    y<=i;
  end generate g2;
end architecture bh;
