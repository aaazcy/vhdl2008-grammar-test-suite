-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "generate" keyword after the condition——`if DEBUG` is missing the `generate` keyword and the generate body follows the condition directly, verifying that generate must appear after the condition to introduce the body
-- Expected Result: Triggers syntax error: missing "generate" after if generate condition
-- Dependencies: None
-- =============================================================
entity ifgen_snn1_ent is
  generic(DEBUG : boolean := true);
  port(din : in bit; dout : out bit);
end entity ifgen_snn1_ent;
architecture bh of ifgen_snn1_ent is
begin
  gen_err : if DEBUG
    dout <= din;
  end generate gen_err;
end architecture bh;
