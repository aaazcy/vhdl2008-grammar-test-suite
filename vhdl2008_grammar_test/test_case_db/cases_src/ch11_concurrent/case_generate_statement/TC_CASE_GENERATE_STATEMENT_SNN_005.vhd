-- =============================================================
-- Case ID: TC_CASE_GENERATE_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_statement ::= generate_label : case expression generate case_generate_alternative { case_generate_alternative } end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "end generate" — the architecture ends directly after the last alternative of case generate without `end generate` closure, verifying that case generate must be explicitly terminated with end generate
-- Expected Result: Triggers syntax error: missing "end generate" in case generate statement
-- Dependencies: None
-- =============================================================
entity cgen_snn5_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0); sel : in integer);
end entity cgen_snn5_ent;
architecture bh of cgen_snn5_ent is
begin
  gen_err : case sel generate
    when 0 =>
      dout <= din;
end architecture bh;
