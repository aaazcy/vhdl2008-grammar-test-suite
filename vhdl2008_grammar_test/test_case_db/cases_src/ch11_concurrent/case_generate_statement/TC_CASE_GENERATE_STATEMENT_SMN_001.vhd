-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Rule Description: The case expression must be a locally static expression of a discrete type; all possible values must be covered by the alternatives (including "when others" if not exhaustive)
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: the expression of case generate is a non-static signal — `sel_sig` is a signal, not locally static, verifying that the expression of case generate must be determined as a static value at compile time
-- Expected Result: Triggers semantic error: case generate expression must be locally static
-- Dependencies: None
-- =============================================================
entity cgen_smn1_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0); sel_sig : in integer);
end entity cgen_smn1_ent;
architecture bh of cgen_smn1_ent is
begin
  gen_err : case sel_sig generate
    when 0 =>
      dout <= din;
    when others =>
      dout <= not din;
  end generate gen_err;
end architecture bh;
