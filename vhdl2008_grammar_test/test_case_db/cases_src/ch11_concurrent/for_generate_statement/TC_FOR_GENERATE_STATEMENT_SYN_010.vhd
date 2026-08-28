-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: explicit end generate label matching — the optional generate_label at end must match the opening label
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_label_ent is
  generic(N:integer:=4);
  port(a:in bit_vector(N-1 downto 0); y:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_label_ent is
begin
  gen_match: for i in 0 to N-1 generate
    y(i) <= a(i);
  end generate gen_match;
end architecture bh;
