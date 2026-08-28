-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_FOR_GENERATE_001
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: generate parameter i referenced outside its generate body scope — i used in a concurrent assignment outside the end generate
-- Expected Result: Triggers semantic error: generate parameter not visible outside its scope
-- Dependencies: None
-- =============================================================
entity fg_smn1_ent is
  generic(N:integer:=4);
  port(a:in bit_vector(N-1 downto 0); y:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_smn1_ent is
begin
  gen_scope: for i in 0 to N-1 generate
    y(i) <= a(i);
  end generate gen_scope;
  -- ERROR: i is not visible here
  y(0) <= a(i);
end architecture bh;
