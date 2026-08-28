-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: parameter_specification using subtype discrete_range — for i in subtype range instead of raw integer range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_subtype_ent is
  port(a:in bit_vector(7 downto 0); y:out bit_vector(7 downto 0));
end entity;
architecture bh of fg_subtype_ent is
  subtype t_idx is integer range 0 to 7;
begin
  gen_sub: for i in t_idx generate
    y(i) <= a(i);
  end generate gen_sub;
end architecture bh;
