-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Case Type: Negative
-- Test Focus: SNN: missing "when" keyword — the alternative starts directly with the choice value `0 =>` without `when`, verifying that a case generate alternative must begin with the when keyword
-- Expected Result: Triggers syntax error: missing "when" keyword in case generate alternative
-- Dependencies: None
-- =============================================================
entity cgen_alt_snn1_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0); sel : in integer);
end entity cgen_alt_snn1_ent;
architecture bh of cgen_alt_snn1_ent is
begin
  gen_err1 : case sel generate
    0 =>
      dout <= din;
  end generate gen_err1;
end architecture bh;
