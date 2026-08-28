-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Rule Description: The choices in each case generate alternative must be locally static and must not overlap with choices in other alternatives
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: duplicate choice — both when branches use the choice value 0, verifying that the choices of each case generate alternative must be mutually exclusive, since overlapping values cause elaboration ambiguity
-- Expected Result: Triggers semantic error: overlapping choices in case generate alternatives
-- Dependencies: None
-- =============================================================
entity cgen_alt_smn2_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0); sel : in integer);
end entity cgen_alt_smn2_ent;
architecture bh of cgen_alt_smn2_ent is
begin
  gen_dup : case sel generate
    when 0 =>
      dout <= din;
    when 0 =>
      dout <= not din;
  end generate gen_dup;
end architecture bh;
