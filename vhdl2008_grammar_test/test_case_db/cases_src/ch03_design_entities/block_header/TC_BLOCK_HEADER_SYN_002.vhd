-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ port_clause [ port_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: Block header with generic+port+their maps — generic clause with 2 generics(integer+time) + generic map(explicit values) + port clause with 2 ports(in+out) + port map(signal mapping), verifying the most complete form of block_header (both generic and port present, each with a map)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bhdr_full_ent is
  port(clk,a:in bit; y:out bit);
end entity;
architecture bh of bhdr_full_ent is
  signal s_mid:bit;
begin
  b_full:block
    generic(G_WIDTH:integer:=8; G_DELAY:time:=1 ns);
    generic map(G_WIDTH=>16, G_DELAY=>500 ps);
    port(p_in:in bit; p_out:out bit);
    port map(p_in=>a, p_out=>s_mid);
    signal s_reg:bit:='0';
  begin
    process(p_in)
    begin
      s_reg<=p_in after G_DELAY;
    end process;
    p_out<=s_reg;
  end block;
  y<=s_mid;
end architecture bh;
