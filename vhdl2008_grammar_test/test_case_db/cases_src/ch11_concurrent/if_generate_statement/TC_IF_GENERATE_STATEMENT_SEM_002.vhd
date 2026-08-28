-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Rule Description: When no condition is true and no else branch exists, the generate body is empty — no hardware is created, but this is legal
-- Case Type: Positive
-- Test Focus: All conditions false and no else——when all generic conditions are false no body is elaborated, verifying the legal empty-generation behavior of if generate with all-false conditions and no else branch
-- Expected Result: Compiles successfully; no hardware generated when all conditions are false
-- Dependencies: None
-- =============================================================
entity ifgen_sem2_ent is
  generic(OPT_A : boolean := false; OPT_B : boolean := false);
  port(din : in bit; dout : out bit);
end entity ifgen_sem2_ent;
architecture bh of ifgen_sem2_ent is
begin
  gen_opt : if OPT_A generate
    dout <= din;
  elsif OPT_B generate
    dout <= not din;
  end generate gen_opt;
end architecture bh;
