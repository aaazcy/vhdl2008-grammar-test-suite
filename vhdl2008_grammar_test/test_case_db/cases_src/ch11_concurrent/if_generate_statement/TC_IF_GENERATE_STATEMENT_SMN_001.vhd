-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Rule Description: The condition in each if/elsif branch of an if generate must be locally static — it cannot depend on signal values which are determined at runtime
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: condition referencing a non-static signal——in `if s_enable generate` the condition depends on a signal value, verifying that an if generate condition must be determined at compile time and cannot depend on runtime signals
-- Expected Result: Triggers semantic error: if generate condition must be locally static
-- Dependencies: None
-- =============================================================
entity ifgen_smn1_ent is
  port(enable : in boolean; din : in bit; dout : out bit);
end entity ifgen_smn1_ent;
architecture bh of ifgen_smn1_ent is
  signal s_enable : boolean;
begin
  s_enable <= enable;
  gen_err : if s_enable generate
    dout <= din;
  end generate gen_err;
end architecture bh;
