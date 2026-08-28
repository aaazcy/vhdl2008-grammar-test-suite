-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_019
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Large-scale multi-component instantiation: declarative part declares 2 component kinds (flip-flop + inverter), for-generate batch-instantiates 8 flip-flops + 8 inverters forming a shift chain, verifying the architecture can contain many component_instantiations and for-generate can iterate multiple components
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_scale_ent is
  generic(N:integer:=8);
  port(clk:in bit; din:in bit; dout:out bit);
end entity;
architecture structural of arch_scale_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  component inv is port(x:in bit; z:out bit); end component;
  signal s_chain:bit_vector(N-1 downto 0);
  signal s_inv:bit_vector(N-1 downto 0);
begin
  gen_ff:for i in 0 to N-1 generate
    u_ff:dff port map(clk=>clk, d=>din, q=>s_chain(i));
    u_i:inv  port map(x=>s_chain(i), z=>s_inv(i));
  end generate;
  dout<=s_inv(N-1);
end architecture structural;
