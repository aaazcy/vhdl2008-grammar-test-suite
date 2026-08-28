-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: generate body with component instantiations — shift register chain: fg_shift_ent entity with dff component, for-generate connects each stage
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_shift_ent is
  generic(N:integer:=8);
  port(clk:in bit; din:in bit; dout:out bit);
end entity;
architecture bh of fg_shift_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  signal s_chain:bit_vector(N-1 downto 0);
begin
  gen_shift: for i in 0 to N-1 generate
    first_stage: if i = 0 generate
      u0:dff port map(clk=>clk, d=>din, q=>s_chain(0));
    else generate
      ux:dff port map(clk=>clk, d=>s_chain(i-1), q=>s_chain(i));
    end generate;
  end generate gen_shift;
  dout <= s_chain(N-1);
end architecture bh;
