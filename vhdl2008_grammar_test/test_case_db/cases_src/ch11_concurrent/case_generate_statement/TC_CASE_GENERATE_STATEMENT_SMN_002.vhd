-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Rule Description: The generate_label at the end of the case generate statement must match the label at the beginning; mismatched labels cause an elaboration error
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: the label after end generate does not match the declared label — declared as `gen_wrong : case` but closed with `end generate gen_mismatch;`, verifying that the opening and closing generate_label must agree
-- Expected Result: Triggers elaboration error: generate label mismatch
-- Dependencies: None
-- =============================================================
entity cgen_smn2_ent is
  port(din : in bit; dout : out bit; sel : in integer);
end entity cgen_smn2_ent;
architecture bh of cgen_smn2_ent is
begin
  gen_wrong : case sel generate
    when 0 =>
      dout <= din;
  end generate gen_mismatch;
end architecture bh;
