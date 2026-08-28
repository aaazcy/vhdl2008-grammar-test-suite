-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SMN_FOR_GENERATE_DUP_LABEL
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: SMN: generate label reused in the same architecture——the gen_bad label is used by two for_generate_statements at once; a generate_label must be unique within one declarative region
-- Expected Result: Triggers analysis error: identifier "gen_bad" already used for a declaration
-- Dependencies: None
-- =============================================================
entity fg_dup_label_ent is
  port(y:out bit);
end entity;
architecture vhdl2008 of fg_dup_label_ent is
begin
  gen_bad: for i in 0 to 2 generate
    y <= '0';
  end generate;
  gen_bad: for i in 0 to 2 generate
    y <= '0';
  end generate;
end architecture vhdl2008;
