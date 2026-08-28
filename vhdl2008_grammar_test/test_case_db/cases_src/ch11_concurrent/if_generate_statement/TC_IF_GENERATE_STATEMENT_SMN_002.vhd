-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Rule Description: Alternative labels within a single if generate statement must be unique; duplicate labels cause elaboration errors
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: duplicate alternative_label——two elsif branches use the same label `alt_dup`, verifying that all alternative_labels within the same if generate must be unique
-- Expected Result: Triggers elaboration error: duplicate alternative label in if generate
-- Dependencies: None
-- =============================================================
entity ifgen_smn2_ent is
  generic(A : boolean := true; B : boolean := false; C : boolean := false);
  port(din : in bit; dout : out bit);
end entity ifgen_smn2_ent;
architecture bh of ifgen_smn2_ent is
begin
  gen_dup : if A generate
    dout <= din;
  elsif alt_dup : B generate
    dout <= not din;
  elsif alt_dup : C generate
    dout <= din;
  end generate gen_dup;
end architecture bh;
