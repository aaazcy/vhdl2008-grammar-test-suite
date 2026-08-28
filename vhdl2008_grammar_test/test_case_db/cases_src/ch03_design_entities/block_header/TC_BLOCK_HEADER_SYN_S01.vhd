-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Test Focus: Block header: [generic_clause generic_map_aspect;] [port_clause port_map_aspect;] — all 4 combinations
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_block_header_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_block_header_syn_s01 is
    signal s_i,s_o:bit;
begin
  blk_p:block is port(p_in:in bit;p_out:out bit); port map(p_in=>s_i,p_out=>s_o);
  begin p_out<=not p_in; end block;
  blk_f:block is generic(G_D:time:=1 ns); generic map(G_D=>2 ns);
    port(p_in:in bit;p_out:out bit); port map(p_in=>s_o,p_out=>s_i);
  begin p_out<=p_in after G_D; end block; s_i<='1'; r<=1;end architecture bh;
