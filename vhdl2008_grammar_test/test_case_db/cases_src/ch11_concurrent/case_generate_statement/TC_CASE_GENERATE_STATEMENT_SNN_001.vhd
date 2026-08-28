-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing generate_label — `case sel generate` has no label identifier and colon before it, verifying that a case generate statement must begin with a generate_label
-- Expected Result: Triggers syntax error: missing generate label in case generate statement
-- Dependencies: None
-- =============================================================
entity cgen_snn1_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0); sel : in integer);
end entity cgen_snn1_ent;
architecture bh of cgen_snn1_ent is
begin
  case sel generate
    when 0 =>
      dout <= din;
  end generate;
end architecture bh;
