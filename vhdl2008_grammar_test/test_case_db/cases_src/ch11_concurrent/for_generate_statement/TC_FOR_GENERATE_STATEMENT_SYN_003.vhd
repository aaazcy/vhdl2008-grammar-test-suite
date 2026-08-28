-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: generate body with declarative part — signal declared locally inside generate body, used within the same iteration; entity fg_decl_ent
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_decl_ent is
  generic(N:integer:=4);
  port(d_in:in bit_vector(N-1 downto 0); d_out:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_decl_ent is
  signal s_clk:bit:='0';
begin
  s_clk <= not s_clk after 5 ns;
  gen_pipe: for i in 0 to N-1 generate
    signal s_local:bit;
  begin
    s_local <= d_in(i) xor s_clk;
    d_out(i) <= s_local;
  end generate gen_pipe;
end architecture bh;
