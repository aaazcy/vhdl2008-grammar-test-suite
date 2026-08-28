-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_GEN_BODY_DECL
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Rule Description: Declarations in generate body must be valid in that scope
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: signal declaration in generate body without begin keyword
-- Expected Result: Triggers semantic error: invalid generate body syntax
-- Dependencies: None
-- =============================================================
entity gen_body_sem1_ent is port(y:out integer); end entity;
architecture bh of gen_body_sem1_ent is
begin
  g1: for i in 0 to 3 generate
    signal s_local:integer;
    s_local<=i;
    y<=s_local;
  end generate;
end architecture bh;
