-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement }
-- Case Type: Positive
-- Test Focus: Generate body with a declarative part + multiple concurrent statements: the for-generate body contains a declarative part (signal) + component_instantiation + concurrent_assign, verifying that a generate body can contain a declarative part and multiple statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gsb_ent is generic(N:integer:=4); port(clk,din:in bit; dout:out bit); end entity;
architecture bh of gsb_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  signal s_chain:bit_vector(N-1 downto 0);
begin
  gen_ff:for i in 0 to N-1 generate
    signal s_local:bit;
  begin
    s_local<=din when i=0 else s_chain(i-1);
    u_dff:dff port map(clk=>clk,d=>s_local,q=>s_chain(i));
  end generate;
  dout<=s_chain(N-1);
end architecture bh;
