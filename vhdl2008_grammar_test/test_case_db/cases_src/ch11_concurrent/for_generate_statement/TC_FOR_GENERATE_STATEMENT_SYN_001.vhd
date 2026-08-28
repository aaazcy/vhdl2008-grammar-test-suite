-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: For-generate with bulk component instantiation + nested if-generate: the outer for i in 0 to N-1 loop instantiates DFFs and the inner if-generate conditionally selects the connection pattern; the generate label is closed after end generate, verifying the full for-generate syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_ent is
  generic(N:integer:=8);
  port(clk:in bit; din:in bit; dout:out bit);
end entity;
architecture bh of fg_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  signal s_chain:bit_vector(N-1 downto 0);
begin
  gen_ff:for i in 0 to N-1 generate
  begin
    first_bit:if i=0 generate
      u_first:dff port map(clk=>clk,d=>din,q=>s_chain(0));
    end generate;
    other_bits:if i>0 generate
      u_dff:dff port map(clk=>clk,d=>s_chain(i-1),q=>s_chain(i));
    end generate;
  end generate gen_ff;
  dout<=s_chain(N-1);
end architecture bh;
