-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ port_clause [ port_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: Block header all 4 combinations: 4 blocks respectively use (no block_header)/(only generic+generic map)/(only port+port map)/(generic+port+their maps) in the same architecture to verify all legal combinations of block_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bhdr_ent is port(a,b:in bit; y1,y2,y3,y4:out bit); end entity;
architecture bh of bhdr_ent is
begin
  b1:block begin y1<=a and b; end block;
  b2:block
    generic(G_DLY:time:=1 ns); generic map(G_DLY=>2 ns);
  begin y2<=a or b after G_DLY; end block;
  b3:block
    port(p_in:in bit; p_out:out bit); port map(p_in=>a, p_out=>y3);
  begin p_out<=not p_in; end block;
  b4:block
    generic(G_W:integer:=1); generic map(G_W=>1);
    port(p_a:in bit; p_b:in bit; p_y:out bit); port map(p_a=>a, p_b=>b, p_y=>y4);
  begin p_y<=p_a xor p_b; end block;
end architecture bh;
