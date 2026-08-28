-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: generates: for-generate, if-generate-else, nested generate, component inst with generic+port map
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_gen_ent is generic(N:integer:=4); port(d_in:in bit_vector(N-1 downto 0); q_out:out bit_vector(N-1 downto 0)); end entity;
architecture rtl of arch_gen_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  signal s_clk:bit:='0';
  signal s_chain:bit_vector(N-1 downto 0);
begin
  gen_ff:for i in 0 to N-1 generate
    u_dff:dff port map(clk=>s_clk,d=>d_in(i),q=>s_chain(i));
  end generate gen_ff;
  gen_inv:if N>2 generate
    signal s_inv:bit_vector(N-1 downto 0);
  begin
    gen_bits:for i in 0 to N-1 generate s_inv(i)<=not s_chain(i); end generate;
    q_out<=s_inv;
  else generate
    q_out<=s_chain;
  end generate gen_inv;
end architecture rtl;
