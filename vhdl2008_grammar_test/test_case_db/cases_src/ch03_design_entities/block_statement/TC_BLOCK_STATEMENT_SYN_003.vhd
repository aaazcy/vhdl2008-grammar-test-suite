-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: Block with header (port + port map): block_header contains port_clause + port_map_aspect, connecting external signals into the block via port map, declarative part contains constant + signal, verifying the port clause of block_header is legal in a block
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_port_ent is port(a,b:in bit; y_and,y_or:out bit); end entity;
architecture bh of blk_port_ent is
  signal s_a,s_b:bit;
begin
  b_input:block
    port(p_a:in bit; p_b:in bit; p_y:out bit);
    port map(p_a=>a, p_b=>b, p_y=>s_a);
  begin
    p_y<=p_a and p_b;
  end block;
  b_proc:block
    port(p_x:in bit; p_z:out bit);
    port map(p_x=>s_a, p_z=>y_and);
    constant C_DLY:time:=1 ns;
  begin
    p_z<=p_x after C_DLY;
  end block;
  y_or<=a or b;
end architecture bh;
