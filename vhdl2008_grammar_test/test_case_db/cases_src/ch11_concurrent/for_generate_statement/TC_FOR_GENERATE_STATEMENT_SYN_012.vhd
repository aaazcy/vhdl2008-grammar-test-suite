-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_012
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: for-generate with conditional signal assignment inside body — each iteration uses a when-else conditional
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_cond_ent is
  generic(N:integer:=4);
  port(sel:in bit; a,b:in bit_vector(N-1 downto 0); y:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_cond_ent is
begin
  gen_mux: for i in 0 to N-1 generate
    y(i) <= a(i) when sel = '0' else b(i);
  end generate gen_mux;
end architecture bh;
