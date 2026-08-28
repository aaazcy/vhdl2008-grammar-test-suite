-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: elsif branch missing the condition——`elsif alt_x : generate` has only the label and generate with no condition, verifying that an elsif branch must have a condition expression
-- Expected Result: Triggers syntax error: missing condition in elsif generate branch
-- Dependencies: None
-- =============================================================
entity ifgen_snn5_ent is
  generic(A : boolean := true; B : boolean := false);
  port(din : in bit; dout : out bit);
end entity ifgen_snn5_ent;
architecture bh of ifgen_snn5_ent is
begin
  gen_multi : if A generate
    dout <= din;
  elsif alt_x : generate
    dout <= not din;
  end generate gen_multi;
end architecture bh;
