-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement ::= for_generate_statement | if_generate_statement | case_generate_statement
-- Case Type: Positive
-- Test Focus: for generate with component instantiation inside
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_spc_ent is
  generic(N:integer:=8);
  port(d:in bit_vector(N-1 downto 0); q:out bit_vector(N-1 downto 0));
end entity;
architecture bh of gen_spc_ent is
  component dff is port(clk,d:in bit; q:out bit); end component;
  signal clk:bit:='0';
begin
  gen_ff:for i in 0 to N-1 generate
    u_dff:dff port map(clk=>clk,d=>d(i),q=>q(i));
  end generate;
end architecture bh;
