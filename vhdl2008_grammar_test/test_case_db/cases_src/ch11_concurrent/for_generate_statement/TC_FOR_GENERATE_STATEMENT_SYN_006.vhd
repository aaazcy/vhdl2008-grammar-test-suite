-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: parameter_specification with integer downto range — for i in N-1 downto 0, reversing connection order
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_downto_ent is
  generic(N:integer:=8);
  port(d_in:in bit_vector(N-1 downto 0); d_out:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_downto_ent is
  signal s_buf:bit_vector(N-1 downto 0);
begin
  gen_rev: for i in N-1 downto 0 generate
    s_buf(i) <= d_in(N-1-i);
    d_out(i) <= s_buf(i);
  end generate gen_rev;
end architecture bh;
