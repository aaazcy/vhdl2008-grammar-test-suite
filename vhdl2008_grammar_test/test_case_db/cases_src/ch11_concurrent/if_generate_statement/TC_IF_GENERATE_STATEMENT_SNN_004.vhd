-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "end generate"——the architecture ends directly after the last body of the if generate without closure, verifying that an if generate must be terminated with end generate
-- Expected Result: Triggers syntax error: missing "end generate" in if generate statement
-- Dependencies: None
-- =============================================================
entity ifgen_snn4_ent is
  generic(HAS_FEATURE : boolean := true);
  port(din : in bit; dout : out bit);
end entity ifgen_snn4_ent;
architecture bh of ifgen_snn4_ent is
begin
  gen_feat : if HAS_FEATURE generate
    dout <= din;
end architecture bh;
