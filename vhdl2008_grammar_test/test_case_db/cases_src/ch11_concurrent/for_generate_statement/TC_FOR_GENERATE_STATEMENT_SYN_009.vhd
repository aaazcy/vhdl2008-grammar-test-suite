-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: generate body with multiple concurrent signal assignments — each iteration drives two outputs from one input
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_multi_ent is
  generic(N:integer:=8);
  port(d_in:in bit_vector(N-1 downto 0); d_pos:out bit_vector(N-1 downto 0); d_neg:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_multi_ent is
begin
  gen_dual: for i in 0 to N-1 generate
    d_pos(i) <= d_in(i);
    d_neg(i) <= not d_in(i);
  end generate gen_dual;
end architecture bh;
