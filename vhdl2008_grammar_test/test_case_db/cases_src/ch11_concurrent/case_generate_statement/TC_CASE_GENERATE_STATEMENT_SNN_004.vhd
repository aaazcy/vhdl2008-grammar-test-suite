-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "generate" keyword after the expression — `case sel` is followed directly by a when branch without the `generate` keyword, verifying that the case expression must be followed by generate to introduce the alternative list
-- Expected Result: Triggers syntax error: missing "generate" after case expression
-- Dependencies: None
-- =============================================================
entity cgen_snn4_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0); sel : in integer);
end entity cgen_snn4_ent;
architecture bh of cgen_snn4_ent is
begin
  gen_err : case sel
    when 0 =>
      dout <= din;
  end generate gen_err;
end architecture bh;
