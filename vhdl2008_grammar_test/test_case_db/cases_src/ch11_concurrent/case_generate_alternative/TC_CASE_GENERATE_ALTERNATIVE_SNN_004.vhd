-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Case Type: Negative
-- Test Focus: SNN: missing "=>" arrow — the when branch has choices but is followed directly by the generate_statement_body with no arrow separator, verifying that there must be "=>" between choices and body
-- Expected Result: Triggers syntax error: missing "=>" after choices in case generate alternative
-- Dependencies: None
-- =============================================================
entity cgen_alt_snn4_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0); sel : in integer);
end entity cgen_alt_snn4_ent;
architecture bh of cgen_alt_snn4_ent is
begin
  gen_err4 : case sel generate
    when 0
      dout <= din;
  end generate gen_err4;
end architecture bh;
